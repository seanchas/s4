class Organizations::Ceo < Organizations::AbstractForm
  column :id_item, {:as => :hidden}
  
  column :surname, {:group => :fio_group}
  column :firstname, {:group => :fio_group}
  column :patronymic, {:group => :fio_group}
  column :position
  
  column :doc_name, {:group => :document_group}
  column :doc_number, {:group => :document_group}
  column :doc_date, {:as => :date, :group => :document_group}

  column :no_attestats, {:as => :norender}
  column :certificates, {:as => :grid, :empty_checkbox => :no_attestats}, Organizations::Grids::Controllers::Attestat.new
  
  column :comment1, {:as => :comment, :group => :supplier_group}
  column :organs_in_place, {:as => :boolean, :group => :supplier_group}
  column :organs_place_other, {:group => :supplier_group}

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
        :onclick => 'window.location = "/organization/reset?section=ceo";return false;'
    }
    cancelButton[:disabled] = :disabled if !row.ceo
    [
      {:input => :submit}
    ] << cancelButton
  end
end