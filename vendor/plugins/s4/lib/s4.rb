module S4

  module Utils
    autoload :Manager,            's4/utils/manager'
    autoload :Connection,         's4/utils/connection'
    autoload :SessionPool,        's4/utils/session_pool'
    autoload :SessionManagement,  's4/utils/session_pool'
  end
  
  
  module Models
    autoload :Base, 's4/models/base'
  end
  
  
  autoload :ResourceType,   's4/resource_type'
  autoload :ResourceSchema, 's4/resource_schema'
  
  
  mattr_accessor :site
  @@site = nil
  
  mattr_accessor :connection_retry_count
  @@connection_retry_count = 2
  
  mattr_accessor :connection_timeout
  @@connection_timeout = 1.second
  
  mattr_accessor :session_pool_size
  @@session_pool_size = 5
  
  mattr_accessor :session_pool_timeout
  @@session_pool_timeout = 1.second
  
  mattr_accessor :expires_in
  @@expires_in = 1.hour
  
  
  def self.connection
    @@connection ||= S4::Utils::Connection.new(site)
  end
  
  def self.session_pool
    @@session_pool ||= S4::Utils::SessionPool.new
  end
  
  
  def self.configure(&block)
    if block_given?
      require 's4/utils/rails'
      if block.arity == 1
        yield self
      else
        instance_eval &block
      end
    end
  end
  
end
