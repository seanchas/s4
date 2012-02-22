class AddColumnsToUserCardsSyncS4s < ActiveRecord::Migration
  def self.up
    add_column :user_cards_sync_s4s, :no_phone_valuta, :boolean
    add_column :user_cards_sync_s4s, :no_phone_fondovii, :boolean
    add_column :user_cards_sync_s4s, :no_phone_srochnii, :boolean
    add_column :user_cards_sync_s4s, :no_phone_cenii, :boolean
    
    add_column :user_cards_sync_s4s, :no_contact_valuta, :boolean
    add_column :user_cards_sync_s4s, :no_contact_fondovii, :boolean
    add_column :user_cards_sync_s4s, :no_contact_srochnii, :boolean
    add_column :user_cards_sync_s4s, :no_contact_cenii, :boolean
  end

  def self.down
    remove_column :user_cards_sync_s4s, :no_phone_valuta
    remove_column :user_cards_sync_s4s, :no_phone_fondovii
    remove_column :user_cards_sync_s4s, :no_phone_srochnii
    remove_column :user_cards_sync_s4s, :no_phone_cenii
    
    remove_column :user_cards_sync_s4s, :no_contact_valuta
    remove_column :user_cards_sync_s4s, :no_contact_fondovii
    remove_column :user_cards_sync_s4s, :no_contact_srochnii
    remove_column :user_cards_sync_s4s, :no_contact_cenii
  end
end
