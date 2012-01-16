class AddColumnToStructures < ActiveRecord::Migration
  def self.up
    add_column :structures, :s4_id, :integer
  end

  def self.down
    remove_column :structures, :s4_id
  end
end
