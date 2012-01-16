class AddS4IdToControllers < ActiveRecord::Migration
  def self.up
    add_column :controllers, :s4_id, :integer
  end

  def self.down
    remove_column :controllers, :s4_id
  end
end
