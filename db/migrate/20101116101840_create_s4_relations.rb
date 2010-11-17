class CreateS4Relations < ActiveRecord::Migration
  def self.up
    create_table :s4_relations, :id => false do |t|
      t.integer :user_id
      t.string  :s4_key
    end
    
    add_index :s4_relations, :user_id, :unique => true
  end

  def self.down
    remove_index :s4_relations, :column => :user_id

    drop_table :s4_relations
  end
end
