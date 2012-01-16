class FixColumnNameForPhones < ActiveRecord::Migration
  def self.up
    rename_column :phones, :number_, :number
    rename_column :phones, :deportament, :kind
  end

  def self.down
    rename_column :phones, :number, :number_
    rename_column :phones, :kind, :deportament
  end
end
