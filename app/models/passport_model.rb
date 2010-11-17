class PassportModel < ActiveRecord::Base
  
  establish_connection "passport_#{RAILS_ENV}"
  
  self.abstract_class = true
  
end
