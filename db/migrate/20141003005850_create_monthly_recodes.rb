class CreateMonthlyRecodes < ActiveRecord::Migration
  def change
    create_table :monthly_recodes do |t|
      t.integer :user_id
      t.integer :samary
      t.integer :welfare
      t.integer :carfare

      t.timestamps
    end
  end
end
