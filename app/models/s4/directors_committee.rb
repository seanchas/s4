module S4
  
  class DirectorsCommittee < S4::Resource
    
    self.resource_type = :directors_committee

    def self.create_xml(rowset)
      S4::Card.create_common_xml('directors_committee', rowset, ["parent_id", "gridname", "user"], true)
    end
  end
  
end
