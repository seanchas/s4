class AddColumnNoShareholderToStructures < ActiveRecord::Migration
  def self.up
    add_column :structures, :no_shareholder, :boolean
  end

  def self.down
    remove_column :structures, :no_shareholder 
  end
end
