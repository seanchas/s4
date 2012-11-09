class NccFederalLaw < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :corr_acc_corr_countr, :no_corr_acc_corr_countr, :corr_acc_offshore, :no_corr_acc_drug, :corr_acc_drug, :no_corr_acc_offshore, :no_shell_bank_acc, :at_control_employee_f, :at_control_employee_i, :at_control_employee_o, :at_control_rules, :at_control_rules_contr, :at_identification, :at_control_of_operation, :at_control_training, :user, :s4_id, :at_control_employee_mail, :at_control_employee_phone, :at_control_employee_position, :at_control_employee_contact_phone_add
  has_many :shell_bank_accs, :foreign_key => "parent_id", :dependent => :destroy
end
