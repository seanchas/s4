class CreateControllers < ActiveRecord::Migration
  def self.up
    create_table :controllers do |t|
      t.string :firstname
      t.string :surname
      t.string :patronymic
      t.string :position
      t.string :doc_name
      t.string :doc_number
      t.date :doc_date
      t.string :user
    end
  end

  def self.down
    drop_table :controllers
  end
end
