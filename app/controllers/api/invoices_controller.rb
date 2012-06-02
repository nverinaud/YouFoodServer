# encoding: utf-8

class Api::InvoicesController < Api::ApiController
  include RestaurantsHelper

  before_filter :valid_token?, :get_restaurant, :api_valid_restaurant?

  # GET /api/invoices
  def index
    
  end

  #PUT /api/invoices/:id
  def update
    @invoice = Invoice.find(params[:id])
    params[:invoice_products].each do |product|
      relation = InvoicesProduct.where("product_id = ? AND invoice_id = ?", product[:id], @invoice.id)
      if (relation[0])
        relation[0].comment = product[:comment]
        relation[0].save
      end
    end
    @invoice.state = params[:state]
    if (!@invoice.save)
      show_error "Impossible de mettre à jour la commande", 403
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
      show_error "Impossible de passer la commande", 403
    end
  end
end