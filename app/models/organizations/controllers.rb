class Organizations::Controllers <  Organizations::AbstractForm
  
  column :controllers, {:as => :grid}, Organizations::Grids::Controllers::Controllers.new
  
  def buttons
    cancelDisabled = false
    row = UserCardsSyncS4.find_by_user(s4_user)
    
    cancelButton = {
        :input => :button,
        :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]),
        :onclick => 'window.location = "/organization/reset?section=controllers";return false;'
    }
    cancelButton[:disabled] = :disabled if !row.controllers
    [
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_add, :scope => [:buttons]), :onclick => 'window.location = "/organization/controllersadd/";return false;'}
    ] << cancelButton
  end
end