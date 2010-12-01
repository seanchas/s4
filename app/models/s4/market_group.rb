module S4
  
  class MarketGroup < S4::Resource
    
    self.resource_type = :market_group
    
    def active?
      !markets.empty?
    end
    
    def markets=(markets)
      markets_ids = markets.split(",").collect(&:to_param) rescue []
      @markets = S4::Market.all(@user).select { |market| markets_ids.include?(market.to_param) }
    end
    
    def markets
      @markets ||= []
    end
    
  end
  
end
