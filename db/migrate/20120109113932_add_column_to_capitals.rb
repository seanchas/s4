class AddColumnToCapitals < ActiveRecord::Migration
  def self.up
    add_column :capitals, :s4_id, :integer
  end

  def self.down
    remove_column :capitals, :s4_id
  end
end
