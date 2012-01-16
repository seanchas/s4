class CreateShellBankAccs < ActiveRecord::Migration
  def self.up
    create_table :shell_bank_accs do |t|
      t.string :name
      t.string :parent_id
    end
  end

  def self.down
    drop_table :shell_bank_accs
  end
end
