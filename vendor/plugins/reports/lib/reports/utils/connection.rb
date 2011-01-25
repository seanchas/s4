require 'uri'
require 'xmlrpc/client'

module Reports
  module Utils
    
    class ConnectionError < RuntimeError
    end
    
    class Connection

      mattr_accessor :instances
      @@instances = {}
      
      def self.new(uri)
        instances[uri] ||= super
      end
      
      def initialize(uri)
        @uri = uri.is_a?(URI) ? uri : URI.parse(uri)
      end
      
      def call(*args)
        begin
          connection.call(*args)
        rescue Exception => error
          handle_error(error)
        end
      end
      
    private
      
      def connection
        XMLRPC::Client.new(@uri.host, @uri.path, @uri.port)
      end
      
      def handle_error(error)
        raise error if error.is_a?(XMLRPC::FaultException)
        @connection = nil
        raise Reports::Utils::ConnectionError.new(error.message)
      end
      
    end
    
  end
end
