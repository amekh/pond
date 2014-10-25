class CreateDailyWorks < ActiveRecord::Migration
  def change
    create_table :daily_works do |t|
      t.integer :user_id
      t.integer :unit_mission
      t.date :start_time
      t.date :end_time
      t.int :type
      t.text :contents
      t.text :memo

      t.timestamps
    end
  end
end
