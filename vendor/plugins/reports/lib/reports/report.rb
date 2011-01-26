module Reports
  
  class Report
    
    def self.all(guid, type)
      Reports.connection.call("Reports.getData", type, guid).collect { |value| new(value) }
    end
    
  end
  
end
