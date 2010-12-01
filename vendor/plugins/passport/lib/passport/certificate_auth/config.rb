module Passport
  module CertificateAuth
    
    class Config
      
      def domains(*domains)
        @domains = domains.collect { |domain| domain.is_a?(URI) ? domain : URI.parse(domain) } if domains.present?
        @domains
      end
      
      def prefix(prefix = nil)
        @prefix = prefix if prefix.present?
        @prefix
      end
      
      def persist!
        @persist = true
      end
      
      def persist?
        @persist
      end
      
    end
    
  end
end
