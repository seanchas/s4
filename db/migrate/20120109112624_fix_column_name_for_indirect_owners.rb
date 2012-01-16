class FixColumnNameForIndirectOwners < ActiveRecord::Migration
  def self.up
    rename_column :indirect_owners, :share_, :share
  end

  def self.down
    rename_column :indirect_owners, :share_, :share
  end
end
