class CreateUnitMissions < ActiveRecord::Migration
  def change
    create_table :unit_missions do |t|
      t.integer :mission_id
      t.integer :user_id
      t.integer :unit_cost
      t.integer :period
      t.integer :limit_over_cost_lower
      t.integer :limit_over_cost_higher

      t.timestamps
    end
  end
end
