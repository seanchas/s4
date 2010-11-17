require 'nokogiri'

module S4
  module Models
    
    class Base
      
      attr_accessor :attributes
      
      def initialize(attributes = {})
        @attributes = ActiveSupport::OrderedHash.new
        self.attributes = attributes
      end
      
      def id
        attributes["id"]
      end
      
      def to_param
        id.to_s
      end
      
      def attributes=(attributes)
        attributes.each do |name, value|
          send(:"#{name}=", value)
        end
      end
      
      def method_missing(symbol, *args, &block)
        name = symbol.to_s
        case name.last
          when "="
            attributes[name.first(-1)] = args.first
          when "?"
            !!attributes[name.first(-1)]
          else
            attributes.key?(name) ? attributes[name] : super
        end
      end

    protected
      
      def self.call(*args)
        S4.connection.call(*args)
      end
      
      def self.call_with_session(*args)
        S4.connection.call_with_session(*args)
      end
      
    end
    
  end
end
