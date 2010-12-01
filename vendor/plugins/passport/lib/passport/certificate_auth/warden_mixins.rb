module Warden
  module Mixins
    module Common

      def certificate_settings
        @certificate_settings ||= Passport::CertificateAuth::certificate_settings(request.domain)
      end
      
      def certificate
        @certificate ||= Passport::CertificateAuth::certificate(certificate_id, request.domain) if certificate_id rescue nil
      end
      
      def certificate?
        !!certificate
      end
      
      def generate_certificate(resource_id)
         Passport::CertificateAuth::generate_certificate(resource_id, request.domain)
      end
      
      def certificate_id
        @certificate_id ||= request.cookies[certificate_settings.name]
      end
      
    end
  end
end
