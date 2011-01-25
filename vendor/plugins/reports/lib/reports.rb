module Reports

  module Utils
    autoload :Connection, 'reports/utils/connection'
  end

  mattr_accessor :site
  @@site = nil

  def self.connection
    @@connection ||= Reports::Utils::Connection.new(site)
  end

  def self.configure(&block)
    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval &block
      end
    end
  end

end
