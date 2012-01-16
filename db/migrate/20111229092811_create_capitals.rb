class CreateCapitals < ActiveRecord::Migration
  def self.up
    create_table :capitals do |t|
      t.string :auth_capital_vol
      t.string :auth_capital_vollit
      t.string :fully_paid
      t.string :unpaid_auth_capital_vol
      t.string :unpaid_auth_capital_vollit
      t.string :no_indirect_owners
      t.string :no_ncc_profiters
      t.string :user
    end
  end

  def self.down
    drop_table :capitals
  end
end
