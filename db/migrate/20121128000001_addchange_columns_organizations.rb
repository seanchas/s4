class AddchangeColumnsOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :tel_country_code, :string
    add_column :organizations, :tel_number, :int
    add_column :organizations, :tel_internal_number, :int

    rename_column :organizations, :tel, :tel_display

    add_column :organizations, :fax_country_code, :string
    add_column :organizations, :fax_number, :int
    add_column :organizations, :fax_internal_number, :int

    rename_column :organizations, :fax, :fax_display
  end

  def self.down
    remove_column :organizations, :tel_country_code, :string
    remove_column :organizations, :tel_number, :int
    remove_column :organizations, :tel_internal_number, :int

    rename_column :organizations, :tel_display, :tel

    remove_column :organizations, :fax_country_code, :string
    remove_column :organizations, :fax_number, :int
    remove_column :organizations, :fax_internal_number, :int

    rename_column :organizations, :fax_display, :fax
  end
end
