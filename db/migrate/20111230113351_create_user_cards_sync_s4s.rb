class CreateUserCardsSyncS4s < ActiveRecord::Migration
  def self.up
    create_table :user_cards_sync_s4s do |t|
      t.string :user 
    end
  end

  def self.down
    drop_table :user_cards_sync_s4s
  end
end
