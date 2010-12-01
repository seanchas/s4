module Passport
  module CertificateAuth

    class Resource
      
      attr_reader :attributes
      
      def initialize(json)
        @attributes = {}
        self.attributes = ActiveSupport::JSON.decode(json)
      end
      
      def attributes=(attributes)
        attributes.each do |name, value|
          send(:"#{name}=", value)
        end
      end
      
      def id
        attributes["id"]
      end
      
      def method_missing(name, *args, &block)
        method_name = name.to_s
        case method_name.last
          when "="
            attributes[method_name.first(-1)] = args.first
          when "?"
            attributes[method_name.first(-1)]
          else
            attributes.key?(method_name) ? attributes[method_name] : super
        end
      end
      
    end

  end
end
