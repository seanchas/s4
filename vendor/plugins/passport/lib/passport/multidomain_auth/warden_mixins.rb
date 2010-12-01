module Warden
  module Mixins
    module Common
      
      def multidomain_signature
        @multidomain_signature ||= Passport::MultidomainAuth::Signature.fetch(self)
      end
      
      def generate_multidomain_signature(origin)
        Passport::MultidomainAuth::Signature.new(self, :domains => Passport::MultidomainAuth::config.domains, :id => user.try(:id), :origin => origin)
      end
      
      def multidomain_signature?
        multidomain_signature.present? && multidomain_signature.valid?
      end
      
    end
  end
end
