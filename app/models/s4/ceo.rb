module S4
  
  class CEO < S4::Resource
    
    self.resource_type = :ceo

    def self.create_xml(row)
      if !row.nil?
        if row.organs_in_place == true
          row.organs_place_other = nil
        end
      end
      S4::Card.create_common_single_xml('ceo', row, ["user", "no_attestats"], true)
    end
  end
  
end
