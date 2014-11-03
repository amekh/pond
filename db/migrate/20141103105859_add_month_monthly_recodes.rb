class AddMonthMonthlyRecodes < ActiveRecord::Migration
  def change
    add_column :monthly_recodes, :month, :string
  end
end
