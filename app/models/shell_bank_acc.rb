class ShellBankAcc < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :name, :parent_id, :id
end