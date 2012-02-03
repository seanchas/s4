module S4
  
  class NccFederalLaw < S4::Resource
    
    self.resource_type = :ncc_federal_law
    def self.create_xml(row)
      if !row.nil? 
        if row.no_corr_acc_corr_countr == true
          row.corr_acc_corr_countr = nil
        end
        if row.no_corr_acc_drug == true
          row.corr_acc_drug = nil
        end
        if row.no_corr_acc_offshore == true
          row.corr_acc_offshore = nil
        end
      end
      
      S4::Card.create_common_single_xml('ncc_federal_law', row, ["user"], true)
    end
  end
  
end
