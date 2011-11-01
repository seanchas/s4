class AuthoritiesController < ApplicationController
  include AuthoritiesHelper
  
  helper :members_menu, :document_menu
  
  def index
    if !session['form'].nil?
      @authority = session['form']
      session.delete('form')
    else
      @authority = Authority.new
    end
    @warrant_types = S4::WarrantType.all(s4_user)
    @warrant_agents = S4::WarrantAgent.all(s4_user)
  end
  
  def create
    authority = params[:authority]
    @authority = Authority.new(authority)
    if @authority.valid?
      scope = {
        'warrant_type_id' => authority['type_id'],
        'agent_id' => authority['user_id']
      }
      if authority[:user_id] == ''
        scope.delete('agent_id')
      end
      S4::WarrantField.scope = scope
      @vars = S4::WarrantField.find_with_scope(s4_user).attributes
      
      if authority[:user_id] == ''
        @vars['agent_fio'] = "#{authority[:lastname]} #{authority[:firstname]} #{authority[:middlename]}"
        @vars['agent_position'] = "#{authority[:position]}"
      end
      
      send_data render_to_pdf({
        :action => "authority_#{authority[:type_id]}",
        :layout => false }
      ), :filename => "authority_#{authority[:type_id]}.pdf"
    else
      session['form'] = @authority
      redirect_to :action => 'index'
    end
  end
end