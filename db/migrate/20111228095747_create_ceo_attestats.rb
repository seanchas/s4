class CreateCeoAttestats < ActiveRecord::Migration
  def self.up
    create_table :ceo_attestats do |t|
      t.string :series
      t.string :number_
      t.string :display_activity
      t.date :ekz_date
      t.string :ekz_number
      t.date :att_date
      t.string :att_number
      t.string :qualification
      t.string :typeof
      t.string :parent_id
    end
  end

  def self.down
    drop_table :ceo_attestats
  end
end
