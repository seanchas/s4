class Licenses < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :number, :licence_type, :date_begin, :date_end, :licence_organ, :kind, :user
end