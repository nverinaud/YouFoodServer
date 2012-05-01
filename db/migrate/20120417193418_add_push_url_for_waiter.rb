class AddPushUrlForWaiter < ActiveRecord::Migration
  def change
    add_column :users, :push_url, :string
  end
end
