class AddColumnToFilialInfos < ActiveRecord::Migration
  def self.up
    add_column :filial_infos, :s4_id, :integer
  end

  def self.down
    remove_column :filial_infos, :s4_id
  end
end
