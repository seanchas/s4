class ApplicationController < ActionController::Base

  before_filter :authenticate_with_s4!

  helper_method :s4_user
  
  def s4_user
    authenticated_user.s4_key if authenticated?
  end

private

  def authenticate_with_s4!
    authenticate!
    throw :warden unless s4_user
  end

end
