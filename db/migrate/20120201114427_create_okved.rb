class CreateOkved < ActiveRecord::Migration
  def self.up
    create_table :okveds do |t|
      t.string :okved
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :okveds
  end
end
