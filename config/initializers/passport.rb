Passport.configure do |passport|

  passport.failure  :welcome_controller
  passport.resource :user
  
  passport.certificate_auth do
    domains "http://beta.micex.ru", "http://beta.micex.com"
    prefix  "passport-manager"
  end
  
  passport.strategies = :certificate
  
  passport.logger = Rails.logger
  
  passport.registration_url = "http://passport-beta.micex.ru/registration"
  passport.login_url        = "http://passport-beta.micex.ru/login"
  passport.logout_url       = "http://passport-beta.micex.ru/logout"
  passport.profile_url      = "http://passport-beta.micex.ru/user"
  
end
