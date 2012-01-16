class AddColumnNoExecutiveCommiteeToStructures < ActiveRecord::Migration
  def self.up
    add_column :structures, :no_executive_commitee, :boolean
  end

  def self.down
    remove_column :structures, :no_executive_commitee
  end
end
