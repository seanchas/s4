class Ceo < ActiveRecord::Base
  self.include_root_in_json = false
   attr_accessible :firstname, :surname, :patronymic, :position, :doc_name, :doc_number, :doc_date, :organs_in_place, :organs_place_other, :user, :s4_id 
   has_many :ceo_attestats, :foreign_key => "parent_id", :dependent => :destroy
end
