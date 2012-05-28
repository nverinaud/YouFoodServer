class CreateInvoiceProducts < ActiveRecord::Migration
  def change
    create_table :invoice_products do |t|
      t.string :comment

      t.timestamps
    end
  end
end
