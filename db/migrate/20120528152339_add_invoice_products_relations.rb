class AddInvoiceProductsRelations < ActiveRecord::Migration
  def change
    add_column :invoices_products, :invoice_id, :integer
    add_column :invoices_products, :product_id, :integer
  end
end
