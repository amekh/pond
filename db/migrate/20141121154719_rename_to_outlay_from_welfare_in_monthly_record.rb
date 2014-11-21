class RenameToOutlayFromWelfareInMonthlyRecord < ActiveRecord::Migration
  def change
    rename_column :monthly_records, :welfare, :outlay
  end
end
