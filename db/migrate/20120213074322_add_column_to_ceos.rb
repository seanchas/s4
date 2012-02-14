class AddColumnToCeos < ActiveRecord::Migration
  def self.up
    add_column :ceos, :no_attestats, :boolean
  end

  def self.down
    remove_column :ceos, :no_attestats
  end
end
