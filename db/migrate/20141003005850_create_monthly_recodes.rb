class CreateMonthlyRecodes < ActiveRecord::Migration
  def change
    create_table :monthly_recodes do |t|
      t.integer :user_id
      t.integer :samary, :null => false, :default => 0
      t.integer :welfare, :null => false, :default => 0
      t.integer :carfare, :null => false, :default => 0

      t.timestamps
    end
  end
end
