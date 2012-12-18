class Organization < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :full_name, :short_name, :full_name_eng, :short_name_eng, :mesto, :post_addr_display, :post_addr_index, :post_addr_country, :post_addr_region, :post_addr_district, :post_addr_city, :post_addr_street, :post_addr_building, :post_addr_additional, :fact_addr, :tel_areacode, :tel_display, :tel_country_code, :tel_number, :tel_internal_number, :fax_areacode, :fax_display, :fax_country_code, :fax_number, :fax_internal_number, :email, :internet, :inn, :kpp, :kpp2, :reg_date, :ogrn, :ogrn_date, :bik, :oksm, :okpo, :okogu, :okfs, :okved, :okopf, :swift, :registry_number_2002, :registry_organ_2002, :registry_organ, :registry_place, :okato, :user, :registry_confirm_series, :registry_confirm_number, :organization_type
  has_many :okveds, :foreign_key => "parent_id", :dependent => :destroy
end
