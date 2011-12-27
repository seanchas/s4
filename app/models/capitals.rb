class Capitals < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :ciframi, :podpis, :ciframi_chast, :podpis_chast, :oplachen_polnost, :id, :user
end
