module S4
  
  class IndirectOwner < S4::Resource
    
    self.resource_type = :indirect_owner
    
    def self.create_xml(rowset)
      S4::Card.create_common_xml('indirect_owner', rowset, ["parent_id"], true)
    end
  end
  
end
