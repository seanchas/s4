class CreateClirings < ActiveRecord::Migration
  def self.up
    create_table :clirings do |t|
      t.string :legal_countries
      t.string :hidden_finance_countries
      t.string :drugs_countries
      t.string :firstname
      t.string :lastname
      t.string :otchestvo
      t.string :plavila_kontrolya
      t.string :otvestv_za_pravila_kontrolya
      t.string :id_client
      t.string :obyaz_kontrol
      t.string :obychenie_kadrov
      t.string :user
    end
  end

  def self.down
    drop_table :clirings
  end
end
