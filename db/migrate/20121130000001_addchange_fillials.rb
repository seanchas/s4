class AddchangeFillials < ActiveRecord::Migration
    def self.up
      add_column :filial_infos, :moscow_tel_country_code, :string
      add_column :filial_infos, :moscow_tel_number, :int
      add_column :filial_infos, :moscow_tel_internal_number, :int

      rename_column :filial_infos, :moscow_tel, :moscow_tel_display
    end

    def self.down
      remove_column :filial_infos, :moscow_tel_country_code, :string
      remove_column :filial_infos, :moscow_tel_number, :int
      remove_column :filial_infos, :moscow_tel_internal_number, :int

      rename_column :filial_infos, :moscow_tel_display, :moscow_tel
    end
  end
