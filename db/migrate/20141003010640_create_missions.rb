class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :companion_id
      t.integer :mission_type_id
      t.string :title, :null => false
      t.string :contents
      t.integer :nes_work_time, :null => false, :default => 0
      t.integer :unnes_work_time_min, :null => false, :default => 0
      t.integer :unnes_work_time_max, :null => false, :default => 0

      t.timestamps
    end
  end
end
