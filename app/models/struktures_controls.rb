class Struktures_Controls < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :firstname, :lastname, :middlename, :user, :parent_id, :gridname
end