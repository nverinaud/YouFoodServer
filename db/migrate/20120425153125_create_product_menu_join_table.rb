class CreateProductMenuJoinTable < ActiveRecord::Migration
  def change
    create_table :menus_products, :id => false do |t|
      t.integer :menu_id
      t.integer :product_id
    end
  end
end
