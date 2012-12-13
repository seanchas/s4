class AddchangeOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :post_addr_index, :string
    add_column :organizations, :post_addr_country, :string
    add_column :organizations, :post_addr_region, :string
    add_column :organizations, :post_addr_district, :string
    add_column :organizations, :post_addr_city, :string
    add_column :organizations, :post_addr_street, :string
    add_column :organizations, :post_addr_building, :string
    add_column :organizations, :post_addr_additional, :string

    rename_column :organizations, :post_addr, :post_addr_display
  end

  def self.down

    remove_column :organizations, :post_addr_index, :string
    remove_column :organizations, :post_addr_country, :string
    remove_column :organizations, :post_addr_region, :string
    remove_column :organizations, :post_addr_district, :string
    remove_column :organizations, :post_addr_city, :string
    remove_column :organizations, :post_addr_street, :string
    remove_column :organizations, :post_addr_building, :string
    remove_column :organizations, :post_addr_additional, :string

    rename_column :organizations, :post_addr_display, :post_addr
  end
end