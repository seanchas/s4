require 'prawn'
require 'prawn/forms'

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
      
      @vars["ceo_fio_short"] = @vars["ceo_fio"]
      @vars["ceo_fio_short"] = @vars["ceo_fio_short"].split(" ")
      @vars["cfs"] = @vars["ceo_fio_short"][0] + " " +  @vars["ceo_fio_short"][1].first + "." +  @vars["ceo_fio_short"][2].first + "."
      
      if @vars["ceo_position"] != ""
        @vars["nbsp_c"] = ","
      else 
         @vars["nbsp_c"] = ""
      end
      
      if @vars["agent_position"] != ""
        @vars["nbsp_a"] = ","
      else 
         @vars["nbsp_a"] = ""
      end
      
      if authority[:user_id] == ''
        @vars['agent_fio'] = "#{authority[:lastname]} #{authority[:firstname]} #{authority[:middlename]}"
        @vars['agent_position'] = "#{authority[:position]}"
      end
      @partial_template = "authority_#{authority[:type_id]}"

      respond_to do |format|
        format.html
        format.pdf {
          prawnto :prawn => {
                    :page_size => 'A4'
                  },
                  :inline => false,
                  :filename => "authority_#{authority[:type_id]}.pdf"
          render :layout=>false
        }
      end
    else
      session['form'] = @authority
      redirect_to :action => 'index'
    end

  end
end