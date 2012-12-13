class AddchangeContacts < ActiveRecord::Migration
    def self.up
      add_column :contacts, :fax_country_code, :string
      add_column :contacts, :fax_number, :int
      add_column :contacts, :fax_internal_number, :int

      rename_column :contacts, :fax, :fax_display

      add_column :contacts, :phone_country_code, :string
      add_column :contacts, :phone_number, :int
      add_column :contacts, :phone_internal_number, :int

      rename_column :contacts, :phone, :phone_display
    end

    def self.down
      remove_column :contacts, :fax_country_code, :int
      remove_column :contacts, :fax_number, :int
      remove_column :contacts, :fax_internal_number, :int

      rename_column :contacts, :fax_display, :fax

      remove_column :contacts, :phone_country_code, :int
      remove_column :contacts, :phone_number, :int
      remove_column :contacts, :phone_internal_number, :int

      rename_column :contacts, :phone_display, :phone
    end
  end
