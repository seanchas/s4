class Okved < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :parent_id, :okved
  belongs_to :parent, :class_name => Organization
end