class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :position
      t.string :documentName
      t.date :documentDate
      t.string :documentNumber
      t.string :place
      t.string :user
    end
  end

  def self.down
    drop_table :admins
  end
end
