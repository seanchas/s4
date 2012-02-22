class RemoveColumnS4IdFromOrganizations < ActiveRecord::Migration
  def self.up
    remove_column :organizations, :s4_id
  end

  def self.down
    add_column :organizations, :s4_id, :integer
  end
end
