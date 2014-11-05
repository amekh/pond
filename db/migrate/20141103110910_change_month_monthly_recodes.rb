class ChangeMonthMonthlyRecodes < ActiveRecord::Migration
  def change
    change_table :monthly_recodes do |t|
        t.change :month, :date
    end
  end
end
