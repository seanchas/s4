module Passport
  module CertificateAuth
    
    def self.certificate_settings(domain = 'localhost')
      domain = certificate_domain_for(domain)
      (@@certificate_settings ||= {})[domain] ||= Resource.new(connection(domain).get("/settings.json"))
    end
    
    def self.certificate(certificate_id, domain = 'localhost')
      domain = certificate_domain_for(domain)
      Resource.new(connection(domain).get("/certificates/#{certificate_id}.json"))
    end
    
    def self.generate_certificate(resource_id, domain = 'localhost')
      domain = certificate_domain_for(domain)
      certificate(ActiveSupport::JSON.decode(connection(domain).get("/certificates.json?user_id=#{resource_id}")), domain)
    end
  
  private
  
    def self.connection(uri)
      Connection.new(uri)
    end
    
    def self.certificate_domain_for(domain)
      return domain if domain.is_a?(URI)
      config.domains.detect { |uri| uri.host =~ /#{domain}$/ } || config.domains.first
    end

  end
end
