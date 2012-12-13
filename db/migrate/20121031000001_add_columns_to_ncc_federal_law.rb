class AddColumnsToNccFederalLaw < ActiveRecord::Migration
  def self.up
    add_column :ncc_federal_laws, :at_control_employee_mail, :string
    add_column :ncc_federal_laws, :at_control_employee_phone, :string
    add_column :ncc_federal_laws, :at_control_employee_position, :string
    add_column :ncc_federal_laws, :at_control_employee_contact_phone_add, :string
  end

  def self.down
    remove_column :ncc_federal_laws, :at_control_employee_mail
    remove_column :ncc_federal_laws, :at_control_employee_phone
    remove_column :ncc_federal_laws, :at_control_employee_position
    remove_column :ncc_federal_laws, :at_control_employee_contact_phone_add
  end
end
