class AuthorityChooice < Base
  
  column :type_id,     :string
  
  validates_presence_of :type_id
end