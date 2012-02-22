class Organizations::Structure < Organizations::AbstractForm

  column :id_item, {:as => :hidden}
  column :main_commitee_name, {:description => true}
  
  column :no_shareholder, {:as => :norender}
  column :shareholder, {:as => :grid, :comment => true, :empty_checkbox => :no_shareholder}, Organizations::Grids::Structure::Structure.new

  column :directors_committee, {:as => :form}, Organizations::Structure::Kollegial_organ.new

  column :no_executive_commitee, {:as => :boolean, :group => :group1, :required => false}
  column :executive_commitee_name, {:group => :group1, :description => true}
  
  column :direction, {:as => :grid, :group => :group1}, Organizations::Grids::Structure::Structure_organa_ypravleniya.new
  
  def buttons
    cancelDisabled = false
    row = UserCardsSyncS4.find_by_user(s4_user)
    
    cancelButton = {
        :input => :button,
        :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]),
        :onclick => "window.location = '/organization/reset?section=structure';return false;"
    }
    cancelButton[:disabled] = :disabled if !row.structure
    [
      {:input => :submit}
    ] << cancelButton
  end
end