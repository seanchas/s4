class Organizations::NccFederalLaw < Organizations::AbstractForm
  
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment, :group => :group1}
  column :corr_acc_corr_countr, {:required => false, :group => :group1}
  column :no_corr_acc_corr_countr, {:as => :boolean, :required => false, :group => :group1}
  
  column :comment2, {:as => :comment, :group => :group2}
  column :corr_acc_offshore, {:required => false, :group => :group2}
  column :no_corr_acc_offshore, {:as => :boolean, :required => false, :group => :group2}
  
  column :comment3, {:as => :comment, :group => :group3}
  column :corr_acc_drug, {:required => false, :group => :group3}
  column :no_corr_acc_drug, {:as => :boolean, :required => false, :group => :group3}

  column :no_shell_bank_acc, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :shell_bank_acc, {:as => :grid, :empty_checkbox => :no_shell_bank_acc}, Organizations::Grids::Ncc_federal_law::Shell_bank_acc.new

  column :comment4, {:as => :comment, :group => :group4}
  column :comment5, {:as => :comment, :group => :group4}
  column :at_control_employee_f, {:group => :group4}
  column :at_control_employee_i, {:group => :group4}
  column :at_control_employee_o, {:group => :group4}

  column :at_control_employee_position, {:group => :group4, :required => true}
  column :at_control_employee_phone, {:group => :group4, :required => true}
  column :at_control_employee_contact_phone_add, {:group => :group4, :required => false}
  column :at_control_employee_mail, {:group => :group4, :required => true}

  column :at_control_rules, {:as => :boolean, :required => false, :group => :group4}
  column :at_control_rules_contr, {:as => :boolean, :required => false, :group => :group4}
  column :at_identification, {:as => :boolean, :required => false, :group => :group4}
  column :at_control_of_operation, {:as => :boolean, :required => false, :group => :group4}
  column :at_control_training, {:as => :boolean, :required => false, :group => :group4}
  
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
        :onclick => "window.location = '/organization/reset?section=ncc_federal_law';return false;"
    }
    cancelButton[:disabled] = :disabled if !row.ncc_federal_law
    [
      {:input => :submit}
    ] << cancelButton
  end
end