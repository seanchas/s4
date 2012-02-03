class StrukturesControl < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :surname, :firstname, :patronymic, :user, :parent_id, :gridname
  belongs_to :parent, :class_name => Structure
end