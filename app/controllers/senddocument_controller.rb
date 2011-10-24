class SenddocumentController < ApplicationController
  
  @sessionId = nil
  
  def index
    @params = params
    if request.post?
      @document = Senddocument.create({:typeId => @params[:typeId], :document => @params[:document]})
      @document.name = 'document'
      @document.action = 'send-document'
      @document.method = 'post'
      if @document.valid?
        S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
        @sessionId = S4.connection.call("s4.openSession", I18n.locale)
        @resource = S4.connection.call("s4.setResource", @sessionId, 'sended_form', 'userId', {
        'file_id_link'=>'http://getfile.com/dfjRFEDFE',
        'file_id'=>'отчет.zip',
        'status'=>'1'
        })
        session['completeMessage'] = "Документ успешно отправлен на Биржу"
      else
        session['form'] = @document
        redirect_to :action => 'index'
      end
    else
      if session['form'].nil?
        @document = Senddocument.new
        @document.name = 'document'
        @document.action = 'send-document'
        @document.method = 'post'
        
        if !session['completeMessage'].nil?
          @completeMessage = session['completeMessage']
          session['completeMessage'] = nil
        end
      else
        @document = session['form']
        session['form'] = nil
      end
    end
  end
  
  def list
    @by_date_start = params['by_date_start']
    @by_date_finish = params['by_date_finish']
    @by_type = params['by_type']
    @document_name = params['document_name']
    @by_sender = params['by_sender']

    if @by_date_start == '' || @by_date_start.nil?
            @by_date_start = ''
    end
    if @by_date_finish == '' || @by_date_finish.nil?
            @by_date_finish = ''
    end
    if @by_type == '' || @by_type.nil?
            @by_type = '15'
    end
    if @document_name == '' || @document_name.nil?
            @document_name = ''
    end
    if @by_sender == '' || @by_sender.nil?
            @by_sender = ''
    end

    S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)

    @doc_params = {
      'sended_form_status' => '1',
      'start_date' => @by_date_start,
      'end_date' => @by_date_finish,
      'sended_form_kind' => '5',
      'sended_form_type' => @by_type,
      'sender' => @by_sender,
      'name' => @document_name
    }
    
    @doc_params.delete_if {|key, value| value == "" }
                
    @documentList = S4.connection.call("s4.getResource", @sessionId, 'sended_form', "76831d27-6daf-44af-bb73-a72875e9a04f", @doc_params, '')
    @documentList = S4::Resource.parse_many(@documentList)

    @typesList = S4.connection.call("s4.getResource", @sessionId, 'sended_form_type', "76831d27-6daf-44af-bb73-a72875e9a04f", {
      'sended_form_kind' => '5'        
    }, '');
    @typesList = S4::Resource.parse_many(@typesList)

    @senderList = S4.connection.call("s4.getResource", @sessionId, 'sender_email', "76831d27-6daf-44af-bb73-a72875e9a04f");
    @senderList = S4::Resource.parse_many(@senderList)
  end
end