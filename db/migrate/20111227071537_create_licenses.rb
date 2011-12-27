class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      t.string :number
      t.string :typeof
      t.string :subject
      t.string :date_create
      t.string :date_expired
      t.string :deportament
      t.string :user
    end
  end

  def self.down
    drop_table :licenses
  end
end
