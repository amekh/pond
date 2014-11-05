class ChangeTypeStartTimeAndEndTimeInDailyWorks < ActiveRecord::Migration
  def change
    change_table :daily_works do |t|
        t.change :start_time, :datetime
        t.change :end_time, :datetime
    end
  end
end
