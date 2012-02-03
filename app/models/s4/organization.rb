module S4
  
  class Organization < S4::Resource
    
    self.resource_type = :organization
    
    def free_markets
      @free_markets ||= markets.select { |market| market.market_group.blank? }
    end
    
    def grouped_markets
      @grouped_markets ||= market_groups.collect(&:markets).flatten
    end

    def markets
      @markets ||= S4::Market.all(@user)
    end
    
    def market_groups
      @market_groups ||= S4::MarketGroup.all(@user)
    end

    def self.create_xml(row)
      S4::Card.create_common_single_xml('organization', row, ["user"], true)
    end
  end
  
end
