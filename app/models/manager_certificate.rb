class ManagerCertificate < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :serial, :number, :date_examiner, :number_examiner, :date_certifying, :number_certifying, :qualification, :typeof,  :parent_id
end
