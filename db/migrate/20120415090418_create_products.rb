class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price
      t.string :name
      t.string :abbreviation
      t.text :description
      t.string :photoURL
      t.boolean :permanent

      t.timestamps
    end
  end
end
