require 'yaml'
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

  def formvalidate
    if params[:_formName] && params[:_formAlias]
      formData = params[params[:_formAlias]]

      @form = eval("#{params[:_formName]}.new(formData)")

      if @form.valid?
        render :inline => "true"
      else
        render :layout => false, :template => 'formtastic_ext/default', :locals => {:form1 => {:name => params[:_formAlias]}}
      end

    else
      render :inline => "#{params[:_formName]}<>#{params[:_formAlias]}<>#{params[params[:_formAlias]]}"
    end
  end
end
