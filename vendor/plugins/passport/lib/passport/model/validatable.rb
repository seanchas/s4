module Passport
  module Model
    
    module Validatable
      
      extend Passport::Utils::Concern
      
      included do
        
        with_options :if => :nickname_validation_required? do |v|
          v.validates_presence_of   :nickname
          v.validates_uniqueness_of :nickname, :allow_blank => true, :case_sensitive => true
          v.validates_length_of     :nickname, :allow_blank => true, :minimum => nickname_length
        end
        
        with_options :if => :email_validation_required? do |v|
          v.validates_presence_of   :email
          v.validates_uniqueness_of :email, :allow_blank => true, :case_sensitive => true
          v.validates_format_of     :email, :allow_blank => true, :with => email_regexp
        end
        
        with_options :if => :password_validation_required? do |v|
          v.validates_presence_of     :password
          v.validates_length_of       :password, :allow_blank => true, :minimum => password_length
          v.validates_confirmation_of :password, :allow_blank => true
        end
        
        alias_method_chain :password=, :change_track unless method_defined?(:"password_without_change_track=")

      end


      def nickname_validation_required?
        !@skip_nickname_validation
      end
      
      def skip_nickname_validation!
        @skip_nickname_validation = true
      end
      
      def email_validation_required?
        !@skip_email_validation
      end
      
      def skip_email_validation!
        @skip_email_validation = true
      end
      
      def password_validation_required?
        !@skip_password_validation && (new_record? || password_changed?)
      end      
      
      def skip_password_validation!
        @skip_password_validation = true
      end
      
      def password_with_change_track=(password)
        @password_changed = true
        self.password_without_change_track = password
      end

      def password_changed?
        @password_changed
      end
      
    end
    
    Passport::Model::configure(self, :nickname_length, :password_length, :email_regexp)

  end
end
