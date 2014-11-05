class RenameTableMonthlyRecodeToMonthlyRecord < ActiveRecord::Migration
  def change
    rename_table :monthly_recodes, :monthly_records
  end
end
