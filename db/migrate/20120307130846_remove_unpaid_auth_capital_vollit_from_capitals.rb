class RemoveUnpaidAuthCapitalVollitFromCapitals < ActiveRecord::Migration
  def self.up
    remove_column :capitals, :unpaid_auth_capital_vollit
  end

  def self.down
    add_column :capitals, :unpaid_auth_capital_vollit, :string
  end
end
