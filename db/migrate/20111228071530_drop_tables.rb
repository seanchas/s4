class DropTables < ActiveRecord::Migration
  def self.up
    execute "DROP TABLE IF EXISTS admins"
    execute "DROP TABLE IF EXISTS admins_attestats"
    execute "DROP TABLE IF EXISTS capitals"
    execute "DROP TABLE IF EXISTS clirings"
    execute "DROP TABLE IF EXISTS contacts"
    execute "DROP TABLE IF EXISTS controllers"
    execute "DROP TABLE IF EXISTS controllers_attestats"
    execute "DROP TABLE IF EXISTS filials"
    execute "DROP TABLE IF EXISTS lica_capitals"
    execute "DROP TABLE IF EXISTS licenses"
    execute "DROP TABLE IF EXISTS phones"
    execute "DROP TABLE IF EXISTS s4_relations"
    execute "DROP TABLE IF EXISTS scheta_clirings"
    execute "DROP TABLE IF EXISTS struktures"
    execute "DROP TABLE IF EXISTS struktures_controls"
    execute "DROP TABLE IF EXISTS struktures_fivepercents"
    execute "DROP TABLE IF EXISTS vigodnopreobretatels"
  end

  def self.down
  end
end
