class RemoveBoardPositionFromStructures < ActiveRecord::Migration
  def self.up
    remove_column :structures, :board_position
  end

  def self.down
    add_column :structures, :board_position, :string
  end
end
