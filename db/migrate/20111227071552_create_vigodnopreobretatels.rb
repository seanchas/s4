class CreateVigodnopreobretatels < ActiveRecord::Migration
  def self.up
    create_table :vigodnopreobretatels do |t|
      t.string :name
      t.string :number
      t.string :date
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :vigodnopreobretatels
  end
end
