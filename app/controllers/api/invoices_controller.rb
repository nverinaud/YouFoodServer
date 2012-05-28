# encoding: utf-8

class Api::InvoicesController < Api::ApiController

  # GET /api/invoices
  def index
    show_error "Not yet implemented", 403
  end

  #PUT /api/invoices/:id
  def update
    invoice_id = params[:id]
    invoices_products = params[:invoice_products]

    @invoice = Invoice.find(invoice_id)

    invoices_products.each do |product|
      relation = InvoiceProducts.where("product_id = ? AND invoice_id = ?", product[:id], @invoice.id)
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