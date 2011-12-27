class CreateStrukturesControls < ActiveRecord::Migration
  def self.up
    create_table :struktures_controls do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :user
      t.integer :parent_id
      t.string :gridname
    end
  end

  def self.down
    drop_table :struktures_controls
  end
end
