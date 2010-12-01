module Passport
  
  module CertificateAuth

    autoload :Config,     'passport/certificate_auth/config'
    autoload :Connection, 'passport/certificate_auth/connection'
    autoload :Resource,   'passport/certificate_auth/resource'


    require 'passport/certificate_auth/base'


    def self.activate!
      check_requirements!
      require 'passport/certificate_auth/strategy'
      require 'passport/certificate_auth/warden_mixins'
      require 'passport/certificate_auth/warden_session_serializer'
      if config.persist?
        require 'passport/certificate_auth/warden_hooks'
      end
    end
    
    def self.check_requirements!
      raise ArgumentError.new("You have to provide at least one domain for certificate authentication.") if config.domains.empty?
    end

    def self.config
      @@config ||= Config.new
    end
    
    def self.configure(&block)
      if block_given?
        if block.arity == 1
          yield config
        else
          config.instance_eval(&block)
        end
      end
      config
    end

  end
  
end
