class AddInvoiceTableRelationship < ActiveRecord::Migration
  def change
    add_column :invoices, :table_id, :integer
  end
end
