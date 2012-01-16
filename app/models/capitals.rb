class Capitals < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :auth_capital_vol, :auth_capital_vollit, :fully_paid, :unpaid_auth_capital_vol, :unpaid_auth_capital_vollit, :no_indirect_owners, :no_ncc_profiters, :id, :user, :s4_id
end
