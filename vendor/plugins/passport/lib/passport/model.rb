require 'passport/model/authenticatable'

module Passport
  
  module Model
    
    def self.configure(m, *accessors)
      accessors.each do |accessor|
        m.class_eval <<-METHOD
        
          def #{accessor}
            if defined?(@#{accessor})
              @#{accessor}
            elsif superclass.respond_to?(:#{accessor})
              superclass.#{accessor}
            else
              Passport.#{accessor}
            end
          end
          
          def #{accessor}=(value)
            @#{accessor} = value
          end
        
        METHOD
      end
    end
    
    def passport(*modules)
      include Passport::Model::Authenticatable

      options = modules.extract_options!

      modules.each do |m|
        include Passport::Model.const_get(m.to_s.camelize)
      end
      
      options.each do |name, value|
        send(:"#{name}=", value)
      end
      
      strategies.each do |s|
        Passport::Strategies.const_get(s.to_s.camelize)
      end
    end
    
  end
  
end
