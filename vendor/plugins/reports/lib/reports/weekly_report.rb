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
      @date   = date.to_date
      @status = status.to_i
    end
    
    def self.scheme
      Reports::Scheme.find("week").last
    end
    
    def scheme
      @scheme ||= self.class.scheme
    end

  end
  
end
