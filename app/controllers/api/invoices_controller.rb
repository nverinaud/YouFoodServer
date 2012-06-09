# encoding: utf-8

class Api::InvoicesController < Api::ApiController
  include RestaurantsHelper
  include Api::ApiRestaurantHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?, :api_valid_zone?

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
    @invoice = Invoice.new(price: params[:price], state: 0)
    @invoice.table = Table.find(params[:table_id])
    @invoice.restaurant = @restaurant
    error = false
    if (!@invoice.save)
      error = true
    else
      params[:invoice_products].each do |product|
        relation = InvoicesProduct.new(comment: product[:comment])
        relation.product = Product.find(product[:product_id])
        relation.invoice = @invoice
        if (!relation.save)
          @invoice.delete
          error = true
        end
      end
    end
    if error
      show_error "Impossible de passer la commande", 500
    end
  end
end
