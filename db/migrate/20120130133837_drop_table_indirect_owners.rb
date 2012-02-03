class DropTableIndirectOwners < ActiveRecord::Migration
  def self.up
    drop_table :indirect_owners
  end

  def self.down
  end
end
