class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :code_country
      t.string :code_operator
      t.string :phone_num
      t.string :osnovnoy
      t.string :fiovladelca
      t.string :dolzhnost
      t.string :catnum
      t.string :deportament
      t.string :user
    end
  end

  def self.down
    drop_table :phones
  end
end
