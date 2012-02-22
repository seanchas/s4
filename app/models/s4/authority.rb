module S4
  
  class Authority < S4::Resource
    
    self.resource_type = :authority
    
    def self.create_xml(row)
      if row.no_executive_commitee?
        row.executive_commitee_name = nil
      end
      S4::Card.create_common_single_xml 'authority', row, ["main_commitee_name", "executive_commitee_name", "no_executive_commitee", "col_commitee_name", "no_col_commitee"]
    end
  end
end
