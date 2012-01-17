class CreateStrukturesControlsFix < ActiveRecord::Migration
  def self.up
    create_table :struktures_controls do |t|
      t.string :surname
      t.string :firstname
      t.string :patronymic
      t.string :user
      t.integer :parent_id
      t.string :gridname
    end
  end

  def self.down
    drop_table :struktures_controls
  end
end
