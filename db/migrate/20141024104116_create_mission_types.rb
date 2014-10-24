class CreateMissionTypes < ActiveRecord::Migration
  def change
    create_table :mission_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
