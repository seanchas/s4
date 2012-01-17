class CreateStrukturesShareholders < ActiveRecord::Migration
  def self.up
    create_table :struktures_shareholders do |t|
      t.string :name
      t.string :share_
      t.integer :parent_id
      t.string :user
    end
  end

  def self.down
    drop_table :struktures_shareholder
  end
end
