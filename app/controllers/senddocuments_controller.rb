class SenddocumentsController < ApplicationController
  include SenddocumentsHelper
  
  helper :members_menu, :document_menu
  
  def message
    @organization = S4::Organization.find(s4_user)
    messageForm_params = params[:messageform]
    
    if !messageForm_params.nil?
      @messageform = Messageform.new( messageForm_params )
      
      if @messageform.valid?
        headers['Cache-Control'] = 'no-cache'
        send_message(messageForm_params)
        @complete_message = t(:complete_message, :scope => [:shared, :sendmessages])
        @messageform = Messageform.new
      else
        @messageform = @messageform
      end
    else
      @messageform = Messageform.new
    end
  end
  
  def form
    @organization = S4::Organization.find(s4_user)
    if !session['form'].nil?
      @senddocument = session.delete('form')
    else
      @senddocument = Senddocument.new
    end
    if !session['complete_message'].nil?
      @complete_message = session['complete_message']
      session.delete('complete_message')
    end
    S4::SendedFormType.scope = {'sended_form_kind' => '5'}
    @document_types = S4::SendedFormType.all_with_scope(s4_user)
  end
  
  def create
    senddocument = params[:senddocument]
    @senddocument = Senddocument.new(senddocument)
    if @senddocument.valid?
      headers['Cache-Control'] = 'no-cache'
      send_document(senddocument)
      session['complete_message'] = t(:complete_message, :scope => [:shared, :senddocument])
    else
      session['form'] = @senddocument
    end
    redirect_to :action => 'form'
  end
  
  def list
    @organization = S4::Organization.find(s4_user)
    
		regex = /\d{2}\.\d{2}\.\d{4}/
    time_now = Time.now
    
    if !session['documentfilter_params'].nil?
      @documentfilter = session['documentfilter_params']
      session.delete('documentfilter_params')
    else
      @documentfilter = params[:documentfilter]
    end
    @documentfilter = Documentfilter.new(@documentfilter)
    
    
    @doc_params = parse_params_not_nil(@documentfilter)
    
    S4::SendedForm.scope = @doc_params
    @documentListing = S4::SendedForm.all_with_scope(s4_user)
    
    S4::SendedFormType.scope = {'sended_form_kind' => '5'}
    @typesListing = S4::SendedFormType.all_with_scope(s4_user)
    
    @senderListing = S4::SendEmail.all_with_scope(s4_user)
  end
  
  def list_filter
    @documentfilter_params = params[:documentfilter]
    session['documentfilter_params'] = @documentfilter_params
    
    redirect_to :action => 'list'
  end
  
  def index
    
  end
  
  def warrant
    
  end
end
