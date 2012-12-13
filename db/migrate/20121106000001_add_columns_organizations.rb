class AddColumnsOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :registry_confirm_series, :int
    add_column :organizations, :registry_confirm_number, :int
  end

  def self.down
    remove_column :organizations, :registry_confirm_series, :int
    remove_column :organizations, :registry_confirm_number, :int
  end
end
