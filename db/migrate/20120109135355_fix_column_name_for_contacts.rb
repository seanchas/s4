class FixColumnNameForContacts < ActiveRecord::Migration
  def self.up
    rename_column :contacts, :deportament, :kind
  end

  def self.down
    rename_column :contacts, :kind, :deportament
  end
end
