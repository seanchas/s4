module Passport
  module CertificateAuth
    
    class Strategy < Passport::Strategies::Base
      
      def valid?
        warden.certificate.present?
      end
      
      def authenticate!
        if resource = Passport::resource.find_for_authentication(:id, warden.certificate.user_id)
          success!(resource)
        else
          fail(:invalid)
        end
      end
    
    end
    
  end
end

Warden::Strategies.add(:certificate, Passport::CertificateAuth::Strategy)
