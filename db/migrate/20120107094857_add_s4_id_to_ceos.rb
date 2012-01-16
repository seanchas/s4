class AddS4IdToCeos < ActiveRecord::Migration
  def self.up
    add_column :ceos, :s4_id, :integer
  end

  def self.down
    remove_column :ceos, :s4_id
  end
end
