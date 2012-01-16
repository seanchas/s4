module S4
  
  class Direction < S4::Resource
    
    self.resource_type = :direction

    def self.create_xml(rowset)
      S4::Card.create_common_xml('direction', rowset, ["parent_id", "gridname"], true)
    end
  end
  
end
