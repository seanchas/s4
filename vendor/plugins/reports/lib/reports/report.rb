module Reports
  
  class Report
    
    PARSE_RE = /^(\d\d\.\d\d)\,(\d)\.$/
    
    def self.all(guid, type)
      Reports.connection.call("Reports.getData", type, guid).collect { |value| new(value) }
    end
    
    def self.new(value)
      super(*PARSE_RE.match(value)[1, 2])
    end
    
    attr_reader :date, :status
    
    def initialize(date, status)
      @date   = date
      @status = status.to_i
    end
    
  end
  
end
