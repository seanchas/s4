class DropTableProfiterContracts < ActiveRecord::Migration
  def self.up
    drop_table :profiter_contracts
  end

  def self.down
  end
end
