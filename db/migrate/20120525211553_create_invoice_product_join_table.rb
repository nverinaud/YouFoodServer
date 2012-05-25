class CreateInvoiceProductJoinTable < ActiveRecord::Migration
  def change
    create_table :invoices_products, :id => false do |t|
      t.integer :invoice_id
      t.integer :product_id
    end
  end
end