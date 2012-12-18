class AddOrganisationTypefix < ActiveRecord::Migration
    def self.up
      rename_column :organizations, :organisation_type, :organization_type
    end

    def self.down
      rename_column :organizations, :organization_type, :organisation_type
    end
  end
