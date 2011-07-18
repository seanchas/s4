class CardsController < ApplicationController
  
  helper :members_menu
  
  def index
    @organization = S4::Organization.find(s4_user)
    @cards = S4::Card.all(s4_user)
  end
  
end
