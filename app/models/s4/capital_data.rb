module S4
  
  class CapitalData < S4::Resource
    
    self.resource_type = :capital_data

    def self.create_xml(row)
      if !row.nil? && row.fully_paid == true
        row.unpaid_auth_capital_vol = row.unpaid_auth_capital_vollit = nil
      end
      S4::Card.create_common_single_xml('capital_data', row, ["user"], true)
    end
  end
  
end
