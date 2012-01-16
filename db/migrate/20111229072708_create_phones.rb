class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :country
      t.string :operator
      t.string :number_
      t.string :main
      t.string :fio
      t.string :position
      t.string :alert_phone_category
      t.string :deportament
      t.string :user
    end
  end

  def self.down
    drop_table :phones
  end
end
