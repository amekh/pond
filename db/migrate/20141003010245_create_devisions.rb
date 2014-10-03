class CreateDevisions < ActiveRecord::Migration
  def change
    create_table :devisions do |t|
      t.integer :leader_user_id
      t.string :name

      t.timestamps
    end
  end
end
