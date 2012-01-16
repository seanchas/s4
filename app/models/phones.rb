class Phones < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :country, :operator, :number, :main, :fio, :position, :alert_phone_category, :kind, :user
end