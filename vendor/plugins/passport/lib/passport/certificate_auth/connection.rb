module Passport
  module CertificateAuth
    
    class Connection
      
      def initialize(uri)
        @uri = uri.is_a?(URI) ? uri : URI.parse(uri)
      end
      
      def get(path)
        response = request(:get, actual_path(path))
        response.is_a?(Net::HTTPOK) ? response.body : nil
      end
    
    private
    
      def request(method, path)
        logger.info("#{method.to_s.upcase} #{@uri.scheme}://#{@uri.host}:#{@uri.port}#{path}") if logger
        result = nil
        time = Benchmark.ms { result = http.send(method, path) }
        logger.info("--> #{result.code} #{result.message} (#{time}ms)") if logger
        result
      end
    
      def actual_path(path)
        [@uri.path, Passport::CertificateAuth::config.prefix, path].compact.join("/").gsub(/\/+/, "/")
      end
    
      def http
        @http ||= Net::HTTP.new(@uri.host, @uri.port)
      end
      
      def logger
        Rails.logger
      end
      
    end
    
  end
end
