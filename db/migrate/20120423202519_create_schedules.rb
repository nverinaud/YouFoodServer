class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
