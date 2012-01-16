class Admins_attestats < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :serial, :number, :typeof, :qualification, :date_order, :number_order, :date_certification, :number_certification,  :parent_id
end