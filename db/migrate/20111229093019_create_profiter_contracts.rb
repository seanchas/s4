class CreateProfiterContracts < ActiveRecord::Migration
  def self.up
    create_table :profiter_contracts do |t|
      t.string :name
      t.string :contract_number
      t.string :contract_date
      t.string :parent_id
    end
  end

  def self.down
    drop_table :profiter_contracts
  end
end
