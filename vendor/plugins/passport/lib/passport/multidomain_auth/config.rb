require 'uri'

module Passport
  module MultidomainAuth
    
    class Config
      
      def domains(*domains)
        @domains = domains.collect { |domain| domain.is_a?(URI) ? domain : URI.parse(domain) } if domains.present?
        @domains
      end
      
    end
    
  end
end
