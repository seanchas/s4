class WelcomeController < ApplicationController
  
  include MicexXMLRPC::ControllerMixins
  
  layout nil
  
  def index
    redirect_to :organization
  end
  
  def xmlrpc
    handle_xmlrpc_request and return if request.post?
    @xmlrpc_methods = xmlrpc_methods
  end
  
end
