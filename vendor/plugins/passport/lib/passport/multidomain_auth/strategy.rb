module Passport
  module MultidomainAuth
    
    class Strategy < Passport::Strategies::Base
      
      def valid?
        warden.multidomain_signature? && warden.multidomain_signature.id?
      end
      
      def authenticate!
        if resource = Passport::resource.find_for_authentication(:id, warden.multidomain_signature.id)
          success!(resource)
        else
          fail(:invalid)
        end
      end
    
    end
    
  end
end

Warden::Strategies.add(:multidomain_signature, Passport::MultidomainAuth::Strategy)
