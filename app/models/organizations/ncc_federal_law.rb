class Organizations::NccFederalLaw < Base
  
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :corr_acc_corr_countr, {:required => false}
  column :no_corr_acc_corr_countr, {:as => :boolean, :required => false}
  
  column :comment2, {:as => :comment}
  column :corr_acc_offshore, {:required => false}
  column :no_corr_acc_offshore, {:as => :boolean, :required => false}
  
  column :comment3, {:as => :comment}
  column :corr_acc_drug, {:required => false}
  column :no_corr_acc_drug, {:as => :boolean, :required => false}

  
  column :shell_bank_acc, {:as => :grid}, Organizations::Grids::Ncc_federal_law::Shell_bank_acc.new
  column :no_shell_bank_acc, {:as => :boolean, :required => false} 
  
  
  column :comment4, {:as => :comment}
  column :comment5, {:as => :comment}
  column :at_control_employee_f
  column :at_control_employee_i
  column :at_control_employee_o
  
  column :at_control_rules, {:as => :boolean, :required => false}
  column :at_control_rules_contr, {:as => :boolean, :required => false}
  column :at_identification, {:as => :boolean, :required => false}
  column :at_control_of_operation, {:as => :boolean, :required => false}
  column :at_control_training, {:as => :boolean, :required => false}
  
end