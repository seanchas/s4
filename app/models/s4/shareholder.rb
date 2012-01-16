module S4
  
  class Shareholder < S4::Resource
    
    self.resource_type = :shareholder
    
    def self.create_xml(rowset)
      S4::Card.create_common_xml('shareholder', rowset, ["parent_id", "user"], true)
    end
  end
  
end
