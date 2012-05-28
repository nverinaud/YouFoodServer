class Api::InvoicesController < Api::ApiController

  # GET /api/invoices
  def index
    show_error "Not yet implemented", 403
  end

  #PUT /api/invoices/:id
  def update
    show_error "Not yet implemented", 403
  end

  #POST /api/invoices
  def create
    logger.debug params

    logger.debug(" Price : #{params[:price]}")

    @invoice = Invoice.new(price: params[:price], state: 0)

    @invoice.table = Table.find(params[:table_id])

    error = false

    if (!@invoice.save)
      error = true
    else
      invoices_products = params[:invoice_products]
      invoices_products.each do |product|
        relation = InvoiceProducts.new(comment: product[:comment])
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