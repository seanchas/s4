class CreateLicaCapitals < ActiveRecord::Migration
  def self.up
    create_table :lica_capitals do |t|
      t.string :familia
      t.string :name
      t.string :otchestvo
      t.string :dolya
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :lica_capitals
  end
end
