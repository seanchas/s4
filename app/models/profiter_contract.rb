class ProfiterContract < ActiveRecord::Base
    self.include_root_in_json = false
    attr_accessible :name, :contract_number, :contract_date, :id, :parent_id
end
