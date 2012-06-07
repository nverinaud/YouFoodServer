class AddInvoiceRestaurantRelationship < ActiveRecord::Migration
  def change
    add_column :invoices, :restaurant_id, :integer
  end
end