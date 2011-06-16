class ApplicationController < ActionController::Base

  before_filter :authenticate_with_s4!
  
  after_filter :cleanup_cache_control

  helper_method :s4_user
  
  def s4_user
    authenticated_user.s4_key if authenticated?
  end
  
  def rescue_action_in_public(exception)
    case exception
      when ActionController::UnknownAction, ActionController::RoutingError, ActiveRecord::RecordNotFound
        render :template => 'welcome/404', :layout => 'error'
      else
        render :template => 'welcome/500', :layout => 'error'
    end
  end

private

  def authenticate_with_s4!
    authenticate!
    throw :warden unless s4_user
  end
  
  def cleanup_cache_control
    response.headers.delete "Cache-Control"
  end

end
