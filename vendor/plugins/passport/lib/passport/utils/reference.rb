module Passport
  module Utils
    
    class Reference

      @@references  = {}
      @@constants   = Hash.new { |container, name| container[name] = name.constantize }

      def self.clear!
        @@constants.clear
      end
      
      def self.get(name)
        class_name = name.to_s.camelize
        @@references[class_name] ||= new(class_name.constantize)
      end
      
      def initialize(name)
        @name = name.to_s
        @@constants[@name] = name if name.respond_to?(:name)
      end
      
      def get
        @@constants[@name]
      end
      
    end
    
  end
end
