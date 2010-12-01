module Passport
  module Controller
    
    module Helpers
      
      extend Passport::Utils::Concern
      
      included do
        helper_method :authenticated?, :authenticated_user
      end
      
      def warden
        request.env['warden']
      end

      def authenticated?
        warden.authenticated?
      end

      def authenticated_user
        warden.user
      end

      def authenticate(*args)
        warden.authenticate(*args)
      end

      def authenticate!(*args)
        warden.authenticate!(*args)
        self.resource = authenticated_user
      end


      def resource_name
        @resource_name ||= Passport::resource.warden_scope_name
      end

      def resource_class
        @resource_class ||= resource_name.to_s.classify.constantize
      end

      def build_resource(data = nil)
        self.resource = resource_class.new(data || params[resource_name] || {})
      end

      def resource
        instance_variable_get(:"@#{resource_name}")
      end

      def resource=(resource)
        instance_variable_set(:"@#{resource_name}", resource)
      end
      
      
      def passport_message(message)
        keys = []
        
        keys << :"#{params[:controller]}.#{params[:action]}.#{message}"
        keys << :"#{params[:controller]}.#{message}"
        keys << message
        
        I18n.translate(keys.shift, :scope => :passport, :default => keys)
      end  

    end
    
  end
end
