module Passport
  module Strategies
    
    class Credentials < Base
      
      attr_reader :credentials, :password

      def valid?
        valid_verb? && valid_controller? && valid_action? && valid_params?
      end
      
      def authenticate!
        resource = Passport::resource.find_for_authentication(:credentials, credentials)
        if resource && resource.password_valid?(password)
          success!(resource)
        else
          fail(:invalid)
        end
      end
    
    private
    
      def valid_verb?
        request.post?
      end
      
      def valid_controller?
        params[:controller] == 'sessions'
      end
      
      def valid_action?
        params[:action] == 'create'
      end
      
      def valid_params?
        @credentials  = authentication_hash[:credentials]
        @password     = authentication_hash[:password]
        credentials.present? && password.present?
      end
      
      def authentication_hash
        @authentication_hash ||= params[scope]
      end
      
    end
    
  end
end

Warden::Strategies.add(:credentials, Passport::Strategies::Credentials)
