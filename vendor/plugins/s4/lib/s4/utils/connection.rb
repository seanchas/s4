require 'uri'
require 'xmlrpc/client'

module S4
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
        retry_count = 0
        begin
          connection.call(*args)
        rescue Exception => error
          if retry_count < S4.connection_retry_count && !error.is_a?(XMLRPC::FaultException)
            retry_count += 1
            retry
          end
          handle_error(error)
        end
      end
      
      def call_with_session(*args)
        begin
          call(args.shift, S4.session_pool.pull_session, *args)
        ensure
          S4.session_pool.push_session
        end
      end
    
    private
      
      def connection
        @connection ||= XMLRPC::Client.new(@uri.host, @uri.path, @uri.port)
      end
      
      def handle_error(error)
        raise error if error.is_a?(XMLRPC::FaultException)
        @connection = nil
        raise S4::Utils::ConnectionError.new(error.message)
      end
      
    end
    
  end
end
