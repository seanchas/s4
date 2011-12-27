class Contacts < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :firstname, :secondname, :otchestvo, :dolzhnost, :code_phone, :phone, :code_fax, :fax, :email, :deportament, :user
end