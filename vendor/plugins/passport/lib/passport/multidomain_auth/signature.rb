module Passport
  module MultidomainAuth
    
    class Signature
      
      attr_accessor :id, :origin, :expires_at
      attr_reader :warden, :domains
      
      delegate :request,      :to => :warden
      delegate :host, :port,  :to => :request
      
      
      def self.fetch(warden)
        new(warden, ActiveSupport::MessageVerifier.new(Passport::secret).verify(warden.params[:signature])) rescue nil
      end
      
      
      def initialize(warden, attributes = {})
        @warden = warden
        self.attributes = attributes
      end
      
      def domains
        @domains ||= []
      end
      
      def domains=(domains = [])
        @domains = domains.collect { |domain| domain.is_a?(URI) ? domain : URI.parse(domain) }.reject { |domain| domain.host == host }
      end
      
      def valid?
        expires_at.present? && expires_at.to_time > Time.now
      end
      
      def id?
        id.present?
      end
      
      def attributes=(attributes)
        attributes.each do |name, value|
          send(:"#{name}=", value)
        end
      end
      
      def to_param
        ActiveSupport::MessageVerifier.new(Passport::secret).generate(
          {
            :id         => id,
            :expires_at => 5.seconds.from_now,
            :domains    => domains.collect(&:to_s),
            :origin     => origin
          }
        )
      end
      
    end
    
  end
end
