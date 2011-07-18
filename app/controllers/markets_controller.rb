class MarketsController < ApplicationController

  helper :members_menu
  
  def index
    @organization = S4::Organization.find(s4_user)
  end
  
  def show
    @organization = S4::Organization.find(s4_user)
    @market = @organization.markets.find { |market| market.to_param == params[:id] }
    @agents = @market.agents
  end
  
end
