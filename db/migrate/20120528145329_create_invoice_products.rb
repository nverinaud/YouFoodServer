class CreateInvoiceProducts < ActiveRecord::Migration
  def change
    create_table :invoices_products do |t|
      t.string :comment

      t.timestamps
    end
  end
end
