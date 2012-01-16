class FixColumnNameForControllersAttestats < ActiveRecord::Migration
  def self.up
    rename_column :controllers_attestats, :number_, :number
  end

  def self.down
  end
end
