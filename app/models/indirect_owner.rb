class IndirectOwner < ActiveRecord::Base
    self.include_root_in_json = false
    attr_accessible :surname, :firstname, :patronymic, :share, :parent_id,  :id
end
