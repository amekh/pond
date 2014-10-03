class CreateUnitMissions < ActiveRecord::Migration
  def change
    create_table :unit_missions do |t|
      t.integer :mission_id
      t.integer :user_id
      t.integer :unit_cost, :null => false, :default => 0
      t.date :start_date, :null => false
      t.integer :period, :null => false, :default => 0
      t.integer :limit_over_cost_lower, :null => false, :default => 0
      t.integer :limit_over_cost_higher, :null => false, :default => 0

      t.timestamps
    end
  end
end
