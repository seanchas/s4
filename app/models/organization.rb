class Organization < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :full_name, :short_name, :full_name_eng, :short_name_eng, :mesto, :post_addr, :fact_addr, :tel_areacode, :tel, :fax, :fax_areacode, :email, :internet, :inn, :kpp, :kpp2, :reg_date, :ogrn, :ogrn_date, :bik, :oksm, :okpo, :okogu, :okfs, :okved, :okopf, :swift, :registry_number_2002, :registry_organ_2002, :registry_organ, :registry_place, :okato, :user
  has_many :okveds, :foreign_key => "parent_id", :dependent => :destroy
end
