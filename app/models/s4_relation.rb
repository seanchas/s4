class S4Relation < PassportRelationsModel
  
  self.primary_key = :user_id
  
  belongs_to :user
  
end
