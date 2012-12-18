class AddOrganisationType < ActiveRecord::Migration
    def self.up
      add_column :organizations, :organisation_type, :string
    end

    def self.down
      remove_column :organizations, :organisation_type, :string
    end
  end
