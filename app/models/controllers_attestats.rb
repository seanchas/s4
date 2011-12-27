class ControllersAttestats < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :serial, :number, :date_order, :number_order, :date_certification, :number_certification, :qualification, :parent_id, :typeof
end
