class AddAllowanceToMonthlyRecord < ActiveRecord::Migration
  def change
    add_column :monthly_records, :allowance, :integer
  end
end
