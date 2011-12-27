class Vigodnopreobretatels < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :name, :number, :date, :id, :parent_id
end
