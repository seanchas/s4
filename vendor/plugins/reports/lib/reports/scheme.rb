module Reports
  
  class Scheme
    
    def self.find(type)
      Reports.connection.call("Reports.getScheme", type)
    end
    
  end
  
end
