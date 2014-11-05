class ChangeTypeRestTimeInDailyWorks < ActiveRecord::Migration
  def change
    change_table :daily_works do |t|
        t.change :rest_time, :float
    end   
  end
end
