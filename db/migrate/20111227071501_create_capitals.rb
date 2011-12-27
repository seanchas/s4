class CreateCapitals < ActiveRecord::Migration
  def self.up
    create_table :capitals do |t|
      t.string :ciframi
      t.string :podpis
      t.string :ciframi_chast
      t.string :podpis_chast
      t.string :user
      t.string :oplachen_polnost
    end
  end

  def self.down
    drop_table :capitals
  end
end
