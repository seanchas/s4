class Organizations::Capital < Organizations::AbstractForm
  
  column :id_item, {:as => :hidden}
  column :comment1, {:description => true, :as => :comment}
  column :auth_capital_vol
  
  column :fully_paid, {:as => :boolean, :required => false}
  
  column :comment2, {:as => :comment}
  column :unpaid_auth_capital_vol, {:required => false}
  
  def initialize(*params)
    @change_alert = true
    super
  end

  def buttons
    cancelDisabled = false
    row = UserCardsSyncS4.find_by_user(s4_user)
    
    cancelButton = {
        :input => :button,
        :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]),
        :onclick => "window.location = '/organization/reset?section=capital';return false;"
    }
    cancelButton[:disabled] = :disabled if !row.capital
    [
      {:input => :submit}
    ] << cancelButton
  end
end