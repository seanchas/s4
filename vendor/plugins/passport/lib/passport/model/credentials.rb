module Passport
  module Model
    
    module Credentials
      
      extend Passport::Utils::Concern

      included do
        attr_accessor :credentials
      end
      
      module ClassMethods
        
        def find_by_credentials(credentials)
          find(:first, :conditions => ["`email` = :credentials OR `nickname` = :credentials", { :credentials => credentials }])
        end
        
      end

    end
    
  end
end
