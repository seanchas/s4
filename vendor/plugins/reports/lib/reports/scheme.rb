module Reports
  
  class Scheme
    
    def self.find(type, organization_type = nil)
      Reports.connection.call("Reports.getScheme", *[type, organization_type].compact)
    end
    
  end
  
end
