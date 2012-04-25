class AddMenuIdToSchedules < ActiveRecord::Migration

  def change
    add_column :schedules, :menu_id, :integer

  end
end
