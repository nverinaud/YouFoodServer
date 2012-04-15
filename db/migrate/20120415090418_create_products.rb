class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.number :price
      t.string :name
      t.string :abbreviation
      t.string :description
      t.string :photoURL
      t.bool :permanent

      t.timestamps
    end
  end
end
