require 'passport/warden/mixins'
require 'passport/warden/session_serializer'
require 'passport/callbacks/initialization'

Rails.configuration.middleware.use Warden::Manager do |warden|
  Passport::warden = warden
end

Rails.configuration.after_initialize do
  class ActionController::Base
    include Passport::Controller::Helpers
  end
end
