class ChangeTelcountrycode < ActiveRecord::Migration
    def self.up
      change_column :organizations, :tel_country_code, :string
    end

    def self.down
      change_column :organizations, :tel_country_code, :int
    end
  end
