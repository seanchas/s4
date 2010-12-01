module Passport
  module Model
    
    module Authenticatable
      
      extend Passport::Utils::Concern

      included do
        attr_accessor :password
      end
      
      def password_valid?(plaintext)
        password_hash == password_digest(plaintext)
      end
    
    protected
    
      def password_digest(plaintext)
        self.class.cypher.digest(plaintext, password_salt)
      end
      
      module ClassMethods
        
        def find_for_authentication(attribute, value)
          finder_method_name = :"find_by_#{attribute}"
          if respond_to?(finder_method_name)
            send(finder_method_name, value)
          else
            find(:first, :conditions => { attribute => value })
          end
        end
        
        def find_or_initialize_with_error_by(attribute, value, error = :invalid)
          record = find_for_authentication(attribute, value)
          unless record
            record  = new
            error   = :blank if value.blank?
            record.errors.add(:base, :"#{attribute}.#{error}")
          end
          record
        end
        
        def cypher
          @cyper ||= Passport::Cyphers.const_get(Passport::cypher.to_s.upcase)
        end
        
        def warden_scope_name
          @warden_scope_name ||= name.underscore
        end
        
        def strategies=(*strategies)
          @strategies = strategies.flatten.compact.uniq.collect(&:to_sym)
        end
        
        def strategies
          @strategies || []
        end
        
      end

    end
    
  end
end
