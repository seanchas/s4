class InsidersController < ApplicationController
  
  skip_before_filter :authenticate_with_s4!
  before_filter :authenticate
  before_filter :check_authentication
  
  def create
    @error = flash[:recaptcha_error] and render :new and return unless verify_recaptcha
    @error = ".errors.file_missing" and render :new and return unless params[:file].present?
    InsidersMailer.deliver_insider_file(authenticated_user.email, params[:file])
    redirect_to insider_path
  end

private

  def check_authentication
    render :unauthenticated unless authenticated?
  end
  
end
