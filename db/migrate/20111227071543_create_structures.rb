class CreateStructures < ActiveRecord::Migration
  def self.up
    create_table :structures do |t|
      t.string :main_commitee_name
      t.string :col_commitee_name
      t.boolean :no_col_commitee
      t.string :board_fio
      t.string :board_firstname
      t.string :board_patronymic
      t.string :board_position
      t.string :executive_commitee_name
      t.string :user
    end
  end

  def self.down
    drop_table :structures
  end
end
