class MarketsController < ApplicationController
  
  def index
    redirect_to market_path(S4::Market.all(s4_user).first)
  end
  
  def show
    @organization = S4::Organization.find(s4_user)
    @market = S4::Market.all(s4_user, params[:id]).first
  end
  
end
