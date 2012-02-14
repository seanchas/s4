class AddColumnToControllers < ActiveRecord::Migration
  def self.up
    add_column :controllers, :no_attestats, :boolean
  end

  def self.down
    remove_column :controllers, :no_attestats
  end
end
