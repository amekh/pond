class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :devision_id
      t.integer :section_id
      t.string :login_name, :null => false
      t.string :login_password, :null => false
      t.string :name, :null => false

      t.timestamps
    end
  end
end
