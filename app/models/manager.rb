class Manager < ActiveRecord::Base
   self.include_root_in_json = false
   attr_accessible :firstname, :patronymic, :surname, :position, :doc_name, :doc_number, :doc_date, :organs_in_place, :organs_place_other, :user 
end