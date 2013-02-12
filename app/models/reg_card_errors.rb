class RegCardErrors < ActiveRecord::Base
  self.include_root_in_json = false
   attr_accessible :common_errors, :show, :licenses, :ceo, :controllers, :structure, :capital, :filials, :ncc_federal_law, :phones, :sendcard, :contactlist, :user
end
