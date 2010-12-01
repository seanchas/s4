module Passport
  module Model
    
    module Editable
      
      extend Passport::Utils::Concern

      included do
        attr_accessor :current_password
        attr_accessor :password_confirmation

        before_save :generate_password
      end
      
      def generate_password
        return if password.blank?
        self.password_salt = self.class.cypher.token
        self.password_hash = password_digest(password)
      end
      
      def update_attributes_with_current_password(params)
        current_password = params.delete(:current_password)
        
        result = if password_valid?(current_password)
          update_attributes(params)
        else
          errors.add(:base, :"current_password.#{current_password.blank? ? :blank : :invalid}")
          self.attributes = params
          false
        end
        
        result
      end
      
      module ClassMethods
      end

    end
    
  end
end
