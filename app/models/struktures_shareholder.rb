class Struktures_shareholder < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :name, :share, :user, :id, :parent_id
end