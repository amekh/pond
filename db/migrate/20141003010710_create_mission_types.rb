class CreateMissionTypes < ActiveRecord::Migration
  def change
    create_table :mission_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
