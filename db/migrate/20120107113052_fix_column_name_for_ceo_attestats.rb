class FixColumnNameForCeoAttestats < ActiveRecord::Migration
  def self.up
    rename_column :ceo_attestats, :number_, :number
  end

  def self.down
  end
end
