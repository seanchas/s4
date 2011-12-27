class Struktures_Fivepercents < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :name, :dola, :user, :id, :parent_id
end