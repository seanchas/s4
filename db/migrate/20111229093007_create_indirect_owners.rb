class CreateIndirectOwners < ActiveRecord::Migration
  def self.up
    create_table :indirect_owners do |t|
      t.string :surname
      t.string :firstname
      t.string :patronymic
      t.string :share_
      t.string :parent_id
    end
  end

  def self.down
    drop_table :indirect_owners
  end
end
