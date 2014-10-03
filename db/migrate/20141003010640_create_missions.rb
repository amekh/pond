class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :companion_id
      t.integer :mission_type
      t.string :title
      t.string :contents
      t.integer :nes_work_time
      t.integer :unnes_work_time_min
      t.integer :unnes_work_time_max

      t.timestamps
    end
  end
end
