module S4
  
  class ShellBankAcc < S4::Resource
    
    self.resource_type = :shell_bank_acc
    def self.create_xml(rowset)
      S4::Card.create_common_xml('shell_bank_acc', rowset, ["parent_id"], true)
    end
  end
  
end
