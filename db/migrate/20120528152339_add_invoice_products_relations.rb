class AddInvoiceProductsRelations < ActiveRecord::Migration
  def change
    add_column :invoice_products, :invoice_id, :integer
    add_column :invoice_products, :product_id, :integer
  end
end
