require 'warden'

module Passport
  
  autoload :Model, 'passport/model'

  module Utils
    autoload :Concern,    'passport/utils/concern'
    autoload :Reference,  'passport/utils/reference'
  end
  

  module Cyphers
    autoload :SHA1, 'passport/cyphers/sha1'
  end
  
  
  mattr_accessor :cypher
  @@cypher = :sha1
  
  mattr_accessor :strategies
  @@strategies = nil

  mattr_accessor :registration_url
  @@registration_url = nil

  mattr_accessor :login_url
  @@login_url = nil
  
  mattr_accessor :logout_url
  @@logout_url = nil
  
  mattr_accessor :profile_url
  @@profile_url = nil

  mattr_accessor :nickname_length
  @@nickname_length = 6
  
  mattr_accessor :password_length
  @@password_length = 6
  
  mattr_accessor :email_regexp
  @@email_regexp = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  mattr_accessor :secret
  @@secret = nil
  
  mattr_accessor :logger
  @@logger = nil
  
  
  def self.reference(object)
    Passport::Utils::Reference.get(object)
  end

  def self.resource(resource = nil)
    @@resource = reference(resource) if resource
    @@resource.get rescue nil
  end
  
  def self.failure(failure = nil)
    @@failure = reference(failure) if failure
    @@failure.get rescue nil
  end
  
  def self.mailer(mailer = nil)
    @@mailer = reference(mailer) if mailer
    @@mailer.get rescue nil
  end
  
  @@plugins = []
  
  def self.certificate_auth(&block)
    @@plugins << CertificateAuth
    CertificateAuth.configure(&block)
  end
  

  def self.multidomain_auth(&block)
    @@plugins << MultidomainAuth
    MultidomainAuth.configure(&block)
  end
  

  def self.configure(&block)
    if block_given?
      require 'passport/warden'

      if block.arity == 1
        yield self
      else
        instance_eval(&block)
      end
    end
  end
  
private

  def self.warden=(warden)
    warden.failure_app        = failure
    warden.default_scope      = resource.warden_scope_name
    warden.default_strategies   *(strategies || [])

    @@plugins.each(&:activate!)
  end
  
end

ActiveRecord::Base.extend Passport::Model
