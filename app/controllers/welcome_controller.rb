class WelcomeController < ApplicationController

  skip_before_filter :authenticate_with_s4!
  
  include MicexXMLRPC::ControllerMixins
  
  def index
    redirect_to :organization
  end
  
  def xmlrpc
    handle_xmlrpc_request and return if request.post?
    @xmlrpc_methods = xmlrpc_methods
  end
  
end
