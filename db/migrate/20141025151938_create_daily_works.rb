class CreateDailyWorks < ActiveRecord::Migration
  def change
    create_table :daily_works do |t|
      t.integer :user_id
      t.integer :unit_mission_id
      t.date :target_date
      t.time :start_time
      t.time :end_time
      t.integer :rest_time
      t.integer :status
      t.text :contents
      t.text :memo

      t.timestamps
    end
  end
end
