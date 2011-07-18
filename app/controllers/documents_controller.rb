class DocumentsController < ApplicationController
  
  helper :members_menu
  
  def index
    @organization = S4::Organization.find(s4_user)
    @documents = S4::Document.all(s4_user)
  end
  
end
