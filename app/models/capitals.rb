class Capitals < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :auth_capital_vol, :fully_paid, :unpaid_auth_capital_vol, :no_indirect_owners, :no_ncc_profiters, :id, :user, :s4_id
end
