class AddPhotoColumnToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.has_attached_file :photo
      t.remove :photoURL
    end
  end

  def self.down
    drop_attached_file :products, :photo
    add_column :products, :photoURL, :string
  end
end
