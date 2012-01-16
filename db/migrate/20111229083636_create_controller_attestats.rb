class CreateControllerAttestats < ActiveRecord::Migration
  def self.up
    create_table :controllers_attestats do |t|
      t.string :series
      t.string :number_
      t.string :display_activity
      t.string :ekz_date
      t.string :ekz_number
      t.string :att_date
      t.string :att_number
      t.string :parent_id
    end
  end

  def self.down
    drop_table :controller_attestats
  end
end
