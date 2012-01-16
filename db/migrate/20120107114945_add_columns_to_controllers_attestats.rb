class AddColumnsToControllersAttestats < ActiveRecord::Migration
  def self.up
    add_column :controllers_attestats, :qualification, :TEXT
    add_column :controllers_attestats, :activity, :TEXT
  end

  def self.down
    remove_column :controllers_attestats, :activity
    remove_column :controllers_attestats, :qualification
  end
end
