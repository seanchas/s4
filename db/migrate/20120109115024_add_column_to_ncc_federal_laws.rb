class AddColumnToNccFederalLaws < ActiveRecord::Migration
  def self.up
    add_column :ncc_federal_laws, :s4_id, :integer
  end

  def self.down
    remove_column :ncc_federal_laws, :s4_id
  end
end
