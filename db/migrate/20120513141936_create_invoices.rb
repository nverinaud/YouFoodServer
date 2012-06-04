class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :price
      t.integer :state

      t.timestamps
    end
  end
end
