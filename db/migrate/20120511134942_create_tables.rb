class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :forks_nb

      t.timestamps
    end
  end
end
