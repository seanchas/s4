module Passport
  module Model
    
    module Activatable
      
      extend Passport::Utils::Concern
      
      included do
        after_create :send_activation_instructions, :unless => :skip_activation?
      end
      
      def activate!
        unless_activated do
          remove_activation_token!
        end
      end
      
      def activated?
        !new_record? && !activation_token?
      end
      
      def send_activation_instructions
        generate_activation_token! unless activation_token?
        Passport::mailer.deliver_activation_instructions(self)
      end
      
      def resend_activation_token
        unless_activated do
          send_activation_instructions
        end
      end
    
      def skip_activation!
        @skip_activation = true
      end
      
    protected

      def skip_activation?
        @skip_activation
      end
      
      def unless_activated(&block)
        unless activated?
          yield
        else
          errors.add(:base, :already_activated)
        end
      end
      
      module ClassMethods
        
        def send_activation_instructions(params)
          resource = find_or_initialize_with_error_by(:credentials, params[:credentials])
          resource.resend_activation_token unless resource.new_record?
          resource
        end
        
        def activate_by_token(token)
          resource = find_or_initialize_with_error_by(:activation_token, token)
          resource.activate! unless resource.new_record?
          resource
        end
        
      end

    end
    
  end
end
