class CreateNccFederalLaws < ActiveRecord::Migration
  def self.up
    create_table :ncc_federal_laws do |t|
      t.string :corr_acc_corr_countr
      t.boolean :no_corr_acc_corr_countr
      t.string :corr_acc_offshore
      t.boolean :no_corr_acc_drug
      t.string :corr_acc_drug
      t.boolean :no_corr_acc_offshore
      t.boolean :no_shell_bank_acc
      t.string :at_control_employee_f
      t.string :at_control_employee_i
      t.string :at_control_employee_o
      t.boolean :at_control_rules
      t.boolean :at_control_rules_contr
      t.boolean :at_identification
      t.boolean :at_control_of_operation
      t.string :at_control_training
      t.string :user
    end
  end

  def self.down
    drop_table :ncc_federal_laws
  end
end
