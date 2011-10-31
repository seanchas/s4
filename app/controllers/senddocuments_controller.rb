class SenddocumentsController < ApplicationController
  include SenddocumentsHelper
  
  helper :members_menu, :document_menu
  
  def message
    messageForm_params = params[:messageform]
    
    @messageForm_params = params[:messageform]
    
    if !messageForm_params.nil? && (!messageForm_params['theme'].nil? && !messageForm_params['text'].nil? && messageForm_params['text'] != '' && messageForm_params['theme'] != '' )
      send_message(messageForm_params)
      @complete_message = t(:complete_message, :scope => [:shared, :sendmessages])
      @messageform = Messageform.new
    else
      @messageform = Messageform.new(messageForm_params)
    end
  end
  
  def form
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
		regex = /\d{2}\.\d{2}\.\d{4}/
    time_now = Time.now
    
    @documentfilter = params[:documentfilter]
    @documentfilter = Documentfilter.new(@documentfilter)
    
    @doc_params = parse_params_not_nil(@documentfilter)
    
    S4::SendedForm.scope = @doc_params
    @documentListing = S4::SendedForm.all_with_scope(s4_user)
    
    S4::SendedFormType.scope = {'sended_form_kind' => '5'}
    @typesListing = S4::SendedFormType.all_with_scope(s4_user)
    
    @senderListing = S4::SendEmail.all_with_scope(s4_user)
  end
  
  def index
    
  end
  
  def warrant
    
  end
end
