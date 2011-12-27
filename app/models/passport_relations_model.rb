class PassportRelationsModel < ActiveRecord::Base
  
  establish_connection "passport_relations_#{RAILS_ENV}"
  
  self.abstract_class = true
  
end
