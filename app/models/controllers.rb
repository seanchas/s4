class Controllers < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :lastname, :firstname, :middlename, :position, :documentName, :documentNumber, :documentDate, :id, :user
end
