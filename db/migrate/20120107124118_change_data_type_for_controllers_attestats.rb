class ChangeDataTypeForControllersAttestats < ActiveRecord::Migration
  def self.up
    change_table :controllers_attestats do |t|
      t.change :att_date, :date
      t.change :ekz_date, :date
    end
  end

  def self.down
    change_table :controllers_attestats do |t|
      t.change :att_date, :string
      t.change :ekz_date, :string
    end
  end
end
