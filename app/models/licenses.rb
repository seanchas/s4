class Licenses < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :number, :subject, :date_create, :date_expired, :typeof, :deportament, :user
end