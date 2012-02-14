class EditableFlagsAddColumnToUserCardsSyncS4s < ActiveRecord::Migration
  def self.up
    add_column :user_cards_sync_s4s, :show, :boolean
    add_column :user_cards_sync_s4s, :licenses, :boolean
    add_column :user_cards_sync_s4s, :ceo, :boolean
    add_column :user_cards_sync_s4s, :controllers, :boolean
    add_column :user_cards_sync_s4s, :structure, :boolean
    add_column :user_cards_sync_s4s, :capital, :boolean
    add_column :user_cards_sync_s4s, :filials, :boolean
    add_column :user_cards_sync_s4s, :ncc_federal_law, :boolean
    add_column :user_cards_sync_s4s, :phones, :boolean
    add_column :user_cards_sync_s4s, :sendcard, :boolean
    add_column :user_cards_sync_s4s, :contactlist, :boolean
  end

  def self.down
    remove_column :user_cards_sync_s4s, :contactlist
    remove_column :user_cards_sync_s4s, :sendcard
    remove_column :user_cards_sync_s4s, :phones
    remove_column :user_cards_sync_s4s, :ncc_federal_law
    remove_column :user_cards_sync_s4s, :filials
    remove_column :user_cards_sync_s4s, :capital
    remove_column :user_cards_sync_s4s, :structure
    remove_column :user_cards_sync_s4s, :controllers
    remove_column :user_cards_sync_s4s, :ceo
    remove_column :user_cards_sync_s4s, :licenses
    remove_column :user_cards_sync_s4s, :show
  end

end
