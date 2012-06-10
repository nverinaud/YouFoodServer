# encoding: utf-8

class Api::InvoicesController < Api::ApiController
  include RestaurantsHelper
  include Api::ApiRestaurantHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?, :api_valid_zone?
  before_filter :api_valid_zone?, except: [:create]

  # GET /api/invoices
  def index
    logger.debug "zone : #{@zone}"
    tables_id = Table.select(:id).find_by_zone_id(@zone.id)
    @invoices = Invoice.find_all_by_table_id(tables_id)
    if (params[:state])
      asked_state_invoices = Invoice.find_all_by_state(params[:state])
      @invoices = @invoices & asked_state_invoices
    end
  end

  # GET /api/invoices/
  def show
    @invoice = Invoice.find(params[:id])
    if (!@invoice)
      show_error "L'invoice n'existe pas", 500
    end
  end

  #PUT /api/invoices/:id
  def update
    @invoice = Invoice.find(params[:id])
    params[:invoice_products].each do |new_invoice_product|
      invoice_product = InvoicesProduct.find(new_invoice_product[:id])
      invoice_product.comment = new_invoice_product[:comment]
      invoice_product.save
    end

    @invoice.state = params[:state]
    if (!@invoice.save)
      show_error "Impossible de mettre à jour la commande", 500
    end
  end

#POST /api/invoices
  def create
    price = params[:price]
    if !price || price == 0
      show_error "Le prix est invalide.", 403
      return
    end

    table_id = params[:table_id]
    if !table_id
      show_error "L'attribute table_id est obligatoire.", 403
      return
    end

    @invoice = Invoice.new(price: price, state: 0)

    begin
      table = Table.find(table_id)
    rescue ActiveRecord::RecordNotFound
      show_error "Aucune table n'existe avec l'id ##{table_id}.", 404
      return
    end

    waiter = table.waiter
    if !waiter
      show_error "Aucun serveur ne gère cette table. (##{table_id}).", 404
      return
    end

    if !waiter.push_url
      show_error "Le serveur est injoignable.", 500
      return
    end

    @invoice.table = table
    @invoice.restaurant = @restaurant

    if (!@invoice.save)
      show_error "Une erreur est survenue lors de la commande.", 500
      return
    end
  
    products = params[:invoice_products]
    if !products
      show_error "Vous devez ajouter des produits à votre commande.", 403
      return
    end

    products.each do |product|
      relation = InvoicesProduct.new(comment: product[:comment])
      relation.product = Product.find(product[:product_id])
      relation.invoice = @invoice
      if (!relation.save)
        @invoice.delete
        show_error "Le produit ##{product[:product_id]} est invalide", 500
        return
      end
    end
    
    options = {
      type: 0,
      table_id: table.id
    }

    response = MicrosoftPushNotificationService.send_notification waiter.push_url, :raw, options

    if !response.is_a? Net::HTTPSuccess
      json_hash = {
        invoice_id: @invoice.id,
        error: "Le server n'est pas joignable.",
        push_response_code: response.code
      }
      render json: json_hash
      return
    end

  end
end
