class AddColumnToUserCardsSyncS4s < ActiveRecord::Migration
  def self.up
    add_column :user_cards_sync_s4s, :card_edited, :boolean, :default => 0
  end

  def self.down
    remove_column :user_cards_sync_s4s, :card_edited
  end
end
