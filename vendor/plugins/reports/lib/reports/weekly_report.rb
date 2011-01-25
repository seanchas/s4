module Reports
  
  class WeeklyReport < Report
    
    def self.all(guid)
      super(guid, "week")
    end
    
  end
  
end
