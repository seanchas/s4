class Contacts < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :fio, :firstname, :patronymic, :position, :phone_areacode, :phone, :fax_areacode, :fax, :email, :kind, :user
end