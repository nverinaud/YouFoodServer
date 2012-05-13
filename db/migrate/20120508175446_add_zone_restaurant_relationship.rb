class AddZoneRestaurantRelationship < ActiveRecord::Migration
  def change
    add_column :zones, :restaurant_id, :integer
  end
end
