class FixColumnNameInLicenses < ActiveRecord::Migration
  def self.up
    rename_column :licenses, :deportament, :kind
  end

  def self.down
    rename_column :licenses, :kind, :deportament
  end
end
