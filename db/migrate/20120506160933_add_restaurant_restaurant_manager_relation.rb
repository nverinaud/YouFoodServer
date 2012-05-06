class AddRestaurantRestaurantManagerRelation < ActiveRecord::Migration
  
  def change
  	add_column :restaurants, :restaurant_manager_id, :integer
  end

end
