class AddZoneWaiterRelationship < ActiveRecord::Migration

  def change
    add_column :zones, :waiter_id, :integer
  end

end
