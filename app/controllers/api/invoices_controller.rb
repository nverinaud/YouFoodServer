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

    invoices_products = params[:invoice_products]

    invoices_products.each do |product|
      @invoice.products << Product.find(product[:product_id])
    end

    if (!@invoice.save)
      show_error "Not yet implemented", 403
    end
  end
end