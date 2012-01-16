class FixColumnNameForContactsPhone < ActiveRecord::Migration
  def self.up
    rename_column :contacts, :tel, :phone
    rename_column :contacts, :tel_areacode, :phone_areacode
  end

  def self.down
    rename_column :contacts, :phone, :tel
    rename_column :contacts, :phone_areacode, :tel_areacode
  end
end
