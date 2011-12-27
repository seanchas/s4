class CreateSchetaClirings < ActiveRecord::Migration
  def self.up
    create_table :scheta_clirings do |t|
      t.text :name
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :scheta_clirings
  end
end
