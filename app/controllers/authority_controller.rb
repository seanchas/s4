require 'htmldoc'

class AuthorityController < ApplicationController
  @sessionId = nil
  
  def render_to_pdf(options = nil)
    data = render_to_string(options)
    pdf = PDF::HTMLDoc.new
    pdf.set_option :footer, '.'
    pdf.set_option :embedfonts, true
    pdf.set_option :webpage, true
    pdf.set_option :charset, 'cp-1251'
    pdf.set_option :top, '0cm'
    pdf.set_option :bottom, '0cm'
    pdf.set_option :left, '1.5cm'
    pdf.set_option :right, '1.5cm'
    pdf << Iconv::iconv('cp1251', 'utf8', data).join
    
    pdf.generate
  end
  
  def index
    @params = params
    @params.delete('controller')
    @params.delete('action')
    @params.delete('format')
    
    if request.post?
      @authority = Authority.create(@params)
      @authority.name = 'authority'
      @authority.action = '/authority?format=pdf'
      @authority.method = 'post'
      if @authority.valid?
        S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
        @sessionId = S4.connection.call("s4.openSession", I18n.locale)
        @fields = S4.connection.call("s4.getResource", @sessionId, 'new_warrant_fields', "76831d27-6daf-44af-bb73-a72875e9a04f", {
          'agent_id' => params[:userId],
          'warrant_type_id' => params[:typeId]
        }, '');
        @fields = S4::Resource.parse_one(@fields)
        @vars = {}
        @fields.each{ |key, value| @vars[key] = value }
        send_data render_to_pdf({ :action => "authority_" + @params[:typeId].to_s, :layout => false }), :filename => "authority_" + @params[:typeId].to_s
      else
        session['form'] = @authrity
        redirect_to :action => 'index'
      end
    else
      if session['form'].nil?
        @authority = Authority.new
        @authority.name = 'authority'
        @authority.action = '/authority?format=pdf'
        @authority.method = 'post'
      else
        @authority = session['form']
        session['form'] = nil
      end
    end
    #S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
    #@sessionId = S4.connection.call("s4.openSession", I18n.locale)
    #@help = S4.connection.call("system.methodHelp", "s4.getUserList")
  end
end