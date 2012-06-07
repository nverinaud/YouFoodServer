class AddTableRelations < ActiveRecord::Migration
  def change
    add_column :tables, :restaurant_id, :integer
    add_column :tables, :zone_id, :integer
  end
end
