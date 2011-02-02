module Reports
  
  class MonthlyReport < Report
    
    def self.all(guid)
      super(guid, "month")
    end
    
    def self.new(value)
      super(value.first, value[1], value.last, value[2 .. -1])
    end
    
    attr_reader :date, :organization_type, :status, :states
    
    def initialize(date, organization_type, status, states)
      @date               = date.to_date
      @organization_type  = organization_type.to_i
      @status             = case status
      when "OK"
        "0"
      when "NOT OK"
        "1"
      else
        "2"
      end
      @states = states
    end
    
    def self.scheme(organization_type)
      Reports::Scheme.find("month", organization_type.to_s)[2..-1]
    end
    
    def scheme
      @scheme ||= self.class.scheme(@organization_type)
    end
    
  end
  
end
