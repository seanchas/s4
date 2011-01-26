module Reports
  
  class MonthlyReport < Report
    
    def self.all(guid)
      super(guid, "month")
    end
    
    def self.new(value)
      puts value.inspect
      super(value.first, value.last, value[1 .. -2])
    end
    
    attr_reader :date, :status, :states
    
    def initialize(date, status, states)
      @date   = date.to_date
      @status = case status
      when "OK"
        "0"
      when "NOT OK"
        "1"
      else
        "2"
      end
      @states = states
    end
    
    def self.scheme
      @@scheme ||= Reports::Scheme.find("month")[1..-2]
    end
    
    def scheme
      self.class.scheme
    end
    
  end
  
end
