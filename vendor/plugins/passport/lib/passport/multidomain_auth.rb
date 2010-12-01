module Passport
  module MultidomainAuth
    
    autoload :Config,     'passport/multidomain_auth/config'
    autoload :Signature,  'passport/multidomain_auth/signature'
    

    def self.activate!
      check_requirements!
      require 'passport/multidomain_auth/warden_mixins'
      require 'passport/multidomain_auth/strategy'
    end

    def self.check_requirements!
      raise ArgumentError.new("You have to provide at least one domain for multidomain authentication.") if config.domains.empty?
      raise ArgumentError.new("You have to provide secret token for multidomain authentication.") if Passport::secret.blank?
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
