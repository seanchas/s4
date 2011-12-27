class Admins < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :lastname, :firstname, :middlename, :position, :documentName, :documentDate, :documentNumber, :place, :user
end
