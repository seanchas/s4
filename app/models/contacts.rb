class Contacts < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :fio, :firstname, :patronymic, :position, :phone_country_code, :phone_areacode, :phone_display, :phone_number, :phone_internal_number, :fax_country_code, :fax_areacode, :fax_display, :fax_number, :fax_internal_number, :email, :kind, :user
end