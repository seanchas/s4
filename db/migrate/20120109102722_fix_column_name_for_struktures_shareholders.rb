class FixColumnNameForStrukturesShareholders < ActiveRecord::Migration
  def self.up
    rename_column :struktures_shareholders, :share_, :share
  end

  def self.down
    rename_column :struktures_shareholders, :share, :share_
  end
end
