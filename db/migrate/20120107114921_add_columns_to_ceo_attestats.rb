class AddColumnsToCeoAttestats < ActiveRecord::Migration
  def self.up
    add_column :ceo_attestats, :activity, :TEXT
  end

  def self.down
    remove_column :ceo_attestats, :activity
  end
end
