class CreateOrganisation < ActiveRecord::Migration
  def self.up
    create_table :organisations do |t|
      t.string :full_name
      t.string :short_name
      t.string :full_name_eng
      t.string :short_name_eng
      t.string :mesto
      t.string :post_addr
      t.string :fact_addr
      t.string :tel_areacode
      t.string :tel
      t.string :fax_areacode
      t.string :fax
      t.string :email
      t.string :internet
      t.string :inn
      t.string :kpp
      t.string :kpp2
      t.string :bik
      t.string :swift
      t.string :oksm
      t.string :registry_number_2002
      t.date :reg_date
      t.string :registry_organ_2002
      t.string :ogrn
      t.date :ogrn_date
      t.string :registry_organ
      t.string :registry_place
      t.string :okpo
      t.string :okogu
      t.string :okfs
      t.string :okopf
      t.string :okato
      t.string :user
      t.integer :s4_id
    end
  end

  def self.down
    drop_table :organisations
  end
end
