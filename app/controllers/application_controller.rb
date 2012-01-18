class ApplicationController < ActionController::Base

  before_filter :authenticate
  before_filter :authenticate_with_s4!
  before_filter :init_s4_user_in_models
  
  after_filter :cleanup_cache_control

  helper_method :s4_user
  
  def s4_organization
    
  end
  
  def s4_user
    authenticated_user.s4_key if authenticated? && authenticated_user.s4_key.present?
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

  def init_s4_user_in_models
    Organizations::Grids::GridStore.s4_user = s4_user
  end

  def authenticate_with_s4!
    authenticate!
    throw :warden unless s4_user.present?
  end
  
  def cleanup_cache_control
    response.headers.delete "Cache-Control"
  end
end
