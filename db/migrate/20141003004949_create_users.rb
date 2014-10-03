class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :devision_id
      t.integer :section_id
      t.string :login_name
      t.string :login_password
      t.string :name

      t.timestamps
    end
  end
end
