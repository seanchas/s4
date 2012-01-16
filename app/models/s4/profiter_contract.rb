module S4
  
  class ProfiterContract < S4::Resource
    
    self.resource_type = :profiter_contract
    def self.create_xml(rowset)
      S4::Card.create_common_xml('profiter_contract', rowset, ["parent_id"], true)
    end
  end
  
end
