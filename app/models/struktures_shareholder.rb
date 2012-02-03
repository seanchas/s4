class StrukturesShareholder < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :name, :share, :user, :id, :parent_id
  belongs_to :parent, :class_name => Structure
end