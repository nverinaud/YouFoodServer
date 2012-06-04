class AddRestaurantPostalCode < ActiveRecord::Migration
  def change
  	add_column :restaurants, :postal_code, :integer
  end
end
