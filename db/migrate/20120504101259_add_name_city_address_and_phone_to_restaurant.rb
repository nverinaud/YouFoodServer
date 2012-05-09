class AddNameCityAddressAndPhoneToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :phone, :string
    add_column :restaurants, :address, :string
  end
end
