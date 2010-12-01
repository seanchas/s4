module Passport
  module Model
    
    module Recoverable
      
      extend Passport::Utils::Concern
      
      def send_password_recovery_instructions
        regenerate_password_recovery_token!
        Passport::mailer.deliver_password_recovery_instructions(self)
      end
      
      def reset_password(params)
        update_attributes(params) and remove_password_recovery_token!
      end
      
    private
      
      module ClassMethods
        
        def send_password_recovery_instructions(params)
          resource = find_or_initialize_with_error_by(:credentials, params[:credentials])
          resource.send_password_recovery_instructions unless resource.new_record?
          resource
        end
        
      end

    end
    
  end
end
