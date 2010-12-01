module S4
  
  class Market < S4::Resource
    
    self.resource_type = :market_info
    
    def agents
      @agents ||= S4::Agent.all(@user, to_param)
    end
    
  end
  
end
