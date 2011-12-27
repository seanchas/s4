class LicaCapitals < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :familia, :name, :otchestvo, :dolya, :parent_id,  :id
end
