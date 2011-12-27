class CreateStrukturesFivepercents < ActiveRecord::Migration
  def self.up
    create_table :struktures_fivepercents do |t|
      t.string :name
      t.string :dola
      t.integer :parent_id
      t.string :user
    end
  end

  def self.down
    drop_table :struktures_fivepercents
  end
end
