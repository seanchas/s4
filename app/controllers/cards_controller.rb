class CardsController < ApplicationController
  helper :members_menu
  include CardsHelper
  include ApplicationHelper
  
  def index
    @cards = S4::Card.all(s4_user)
  end
  

  def sendcard
    @reg_card_error = getErrors

    if !session['card_executor'].nil?
      @card_executor = session.delete('card_executor')
    elsif row =  RegCardExecutor.find_by_user(s4_user)
      data = row.attributes.symbolize_keys
      data[:item_id] = data.delete(:id)
      data.delete(:s4_id)
      data.delete(:user)
      @card_executor = Cards::SendCard.new(data)
    else
      @card_executor = Cards::SendCard.new({:id_item => 0})
    end
  end

  def sendcardsave
    sendcardData = params[:card_executor]
    sendcardForm = Cards::SendCard.new(sendcardData)
    if sendcardForm.valid?
      if sendcardData[:item_id].is_numeric? && sendcardData[:item_id] != "0"
        RegCardExecutor.update sendcardData[:item_id], sendcardData
      else
        sendcardData[:user] = s4_user
        row = RegCardExecutor.new(sendcardData)
        row.save
      end
      
      begin
        @data = send_card(sendcardData)
        win_ch = Iconv.new('windows-1251', 'utf-8')
        @data = Nokogiri::XML::parse(win_ch.iconv(@data), nil,  'windows-1251')

        respond_to do |format|
          format.xml {
            inn = S4::Organization.find(s4_user).inn
            response.headers['Content-Disposition'] = "attachment;filename=\"#{inn}_#{DateTime.now.strftime("%d%m%y")}.xml\""
            response.headers['Content-Description'] = 'File Transfer'
            response.headers['Content-Transfer-Encoding'] = 'binary'
            response.headers['Expires'] = '0'
            response.headers['Pragma'] = 'public'

            render :layout=>false, :xml => @data.to_xml
          }
        end
        return
      rescue Exception => e
        logger.debug "SEND CARD ERROR MESSAGE: #{e.message}\n#{e.backtrace.to_yaml}\n\n"
        Rails.cache.write cache_key('cards.sendcard.reg_card_error'), e.message
        session['card_executor_data'] = sendcardData
      end
    else
      session['card_executor'] = sendcardForm
    end
    redirect_to :action => :sendcard
  end
end
