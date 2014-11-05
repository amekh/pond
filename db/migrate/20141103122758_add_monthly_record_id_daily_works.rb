class AddMonthlyRecordIdDailyWorks < ActiveRecord::Migration
  def change
    add_column :daily_works, :monthly_record_id, :integer
  end
end
