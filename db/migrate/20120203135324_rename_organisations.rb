class RenameOrganisations < ActiveRecord::Migration
  def self.up
    rename_table :organisations, :organizations
  end

  def self.down
    rename_table :organizations, :organisations
  end
end
