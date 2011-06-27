class InsidersController < ApplicationController
  
  skip_before_filter :authenticate_with_s4!
  
  def create
    if verify_recaptcha
      @error = ".errors.file_missing" and render :new and return unless params[:file].present?
      render :new
    else
      @error = flash[:recaptcha_error]
      render :new
    end
  end
  
end
