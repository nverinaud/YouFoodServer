class AddCookerRestaurantRelationship < ActiveRecord::Migration
  
	def change
		add_column :users, :restaurant_id, :integer
	end

end
