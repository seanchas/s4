class ApplicationController < ActionController::Base

  before_filter :set_s4_user
  
  helper_method :s4_user
  
  def s4_user
    session[:s4_user] ||= 1
  end

private

  def set_s4_user
    session[:s4_user] = params[:user] if params[:user]
  end

end
