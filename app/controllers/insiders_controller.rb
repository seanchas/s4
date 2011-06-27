class InsidersController < ApplicationController
  
  skip_before_filter :authenticate_with_s4!
  
  def create
    if verify_recaptcha
      render :new
    else
      @error = flash[:recaptcha_error]
      render :new
    end
  end
  
end
