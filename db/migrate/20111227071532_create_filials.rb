class CreateFilials < ActiveRecord::Migration
  def self.up
    create_table :filials do |t|
      t.string :adres
      t.string :code_town
      t.string :phone
      t.string :firstname
      t.string :lastname
      t.string :otchestvo
      t.string :dolzhnost
      t.string :moscow
      t.string :kolvo
      t.string :user
    end
  end

  def self.down
    drop_table :filials
  end
end
