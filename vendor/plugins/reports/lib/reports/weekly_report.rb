module Reports
  
  class WeeklyReport < Report
    
    def self.all(guid)
      super(guid, "week")
    end
    
    def self.new(value)
      super(value.first, value.last)
    end
    
    attr_reader :date, :status
    
    def initialize(date, status)
      @date   = date
      @status = status.to_i
    end
    
  end
  
end
