class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :type
      t.string :name
      t.string :phone
      t.string :address
      t.integer :zipCode
      t.string :city

      t.timestamps
    end
  end
end
