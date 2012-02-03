class RegCardErrors < ActiveRecord::Base
  self.include_root_in_json = false
   attr_accessible :common_errors, :information, :licenses, :ceo, :controllers, :structure, :capital, :filials, :ncc_federal_law, :phones, :sendcard, :contactlist, :user 
end
