module S4
  
  class Controller < S4::Resource
    
    self.resource_type = :controller
    def self.create_xml(rowset)
      rowset.collect {|r| r.s4_id = -1 * r.id.to_i}
      S4::Card.create_common_xml('controller', rowset, ["user", "no_attestats"], true)
    end
  end
  
end
