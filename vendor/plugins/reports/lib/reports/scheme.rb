module Reports
  
  class Scheme
    
    def self.find(type, organization_type = 0)
      Reports.connection.call("Reports.getScheme", type, organization_type.to_s)
    end
    
  end
  
end
