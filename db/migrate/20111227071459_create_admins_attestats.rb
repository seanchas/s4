class CreateAdminsAttestats < ActiveRecord::Migration
  def self.up
    create_table :admins_attestats do |t|
      t.string :serial
      t.string :number
      t.date :date_order
      t.string :number_order
      t.date :date_certification
      t.string :qualification
      t.integer :parent_id
      t.string :number_certification
      t.string :typeof
    end
  end

  def self.down
    drop_table :admins_attestats
  end
end
