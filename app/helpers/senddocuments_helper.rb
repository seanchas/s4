module SenddocumentsHelper
  
  def send_document(params)
    uploaded = params[:document]
    File.open(Rails.root.join('public', 'uploads', uploaded.original_filename), 'w') do |file|
      file.write(uploaded.read)
    end
    
    file_link = "#{request.protocol}#{request.host}/uploads/#{uploaded.original_filename}"
    scope = {
      'sended_form_type' => params[:type_id],
      'sended_date'      => '12.12.2012',
      'file_id_link'     => file_link,
      'file_id'          => uploaded.original_filename,
      'status'           => '1'
    }
    S4::SendedForm.scope = scope
    S4::SendedForm.set_with_scope(s4_user)
  end
  
  def send_message(params)
    scope = {
      'sended_form_type' => '13',
      'name' => params['theme'],
      'message_body' => params['text'],
      'status' => '6'
    }
    S4::SendedForm.scope = scope
    S4::SendedForm.set_with_scope(s4_user)
  end
  
  def parse_params_not_nil(documentfilter)
    
    regex = /\d{2}\.\d{2}\.\d{4}/

    if !documentfilter.nil? && (!documentfilter['by_date_start'].nil? && documentfilter['by_date_start'] != '' && documentfilter['by_date_start'] =~ regex)
      @by_date_start = documentfilter['by_date_start']
    else
        @by_date_start = '01.01.2001'
    end
    
    if !documentfilter.nil? && (!documentfilter['by_date_finish'].nil? && documentfilter['by_date_finish'] != '' && documentfilter['by_date_finish'] =~ regex)
      @by_date_finish = documentfilter['by_date_finish']
    else 
        @by_date_finish = ''
    end
    
    if !documentfilter.nil? && (documentfilter['by_type'] != '' && !documentfilter['by_type'].nil?)
      @by_type = documentfilter['by_type']
    else 
        @by_type = ''
    end
    
    if !documentfilter.nil? && (documentfilter['document_name'] != '' && !documentfilter['document_name'].nil?)
      @document_name = documentfilter['document_name']
    else 
        @document_name = ''
    end
    if !documentfilter.nil? && (documentfilter['by_sender'] != '' && !documentfilter['by_sender'].nil?)
      @by_sender = documentfilter['by_sender']
    else 
        @by_sender = ''
    end
    
    
    @doc_params = {
      #'sended_form_status' => '1',
      'start_date' => @by_date_start,
      'end_date' => @by_date_finish,
      'sended_form_kind' => '5',
      'sended_form_type' => @by_type,
      'sender' => @by_sender,
      'name' => @document_name
    }
    
    return @doc_params.delete_if {|key, value| value == "" }
  end
  
end
