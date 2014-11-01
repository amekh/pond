class ChangeTypeStartTimeAndEndTimeToDailyWorks < ActiveRecord::Migration
  def change
    change_table :daily_works do |t|
      t.change :start_time, :string
      t.change :end_time, :string
    end
  end
end
