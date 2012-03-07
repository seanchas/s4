class Organizations::License < Organizations::AbstractForm
  column :banking, {:as => :grid}, Organizations::Grids::Licenses::Banking.new
  column :professionalmember, {:as => :grid}, Organizations::Grids::Licenses::Professionalmember.new
  column :forwardmarket, {:as => :grid}, Organizations::Grids::Licenses::Forwardmarket.new
  column :other, {:as => :grid}, Organizations::Grids::Licenses::Other.new

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
        :onclick => "window.location = '/organization/reset?section=licenses';return false;"
    }
    cancelButton[:disabled] = :disabled if !row.licenses
    [
      {:input => :submit}
    ] << cancelButton
  end
end