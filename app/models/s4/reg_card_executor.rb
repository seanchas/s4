module S4
  
  class RegCardExecutor < S4::Resource
    
    self.resource_type = :reg_card_executor

    def self.create_xml(row)
      S4::Card.create_common_single_xml('reg_card_executor', row, ["user"], true)
    end
  end
  
end
