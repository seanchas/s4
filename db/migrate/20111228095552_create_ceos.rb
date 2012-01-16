class CreateCeos < ActiveRecord::Migration
  def self.up
    create_table :ceos do |t|
      t.string :firstname
      t.string :surname
      t.string :patronymic
      t.string :position
      t.string :doc_name
      t.string :doc_number
      t.date :doc_date
      t.boolean :organs_in_place
      t.string :organs_place_other
    end
  end

  def self.down
    drop_table :ceos
  end
end
