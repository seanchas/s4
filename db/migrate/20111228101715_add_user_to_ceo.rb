class AddUserToCeo < ActiveRecord::Migration
  def self.up
    add_column :ceos, :user, :string
  end

  def self.down
    remove_column :ceos, :user
  end
end
