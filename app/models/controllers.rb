class Controllers < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :firstname, :surname, :patronymic, :position, :doc_name, :doc_number, :doc_date, :id, :user, :s4_id
end
