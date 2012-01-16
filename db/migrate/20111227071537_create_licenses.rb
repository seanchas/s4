class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      t.string :number
      t.string :licence_type
      t.string :licence_organ
      t.string :date_begin
      t.string :date_end
      t.string :deportament
      t.string :user
    end
  end

  def self.down
    drop_table :licenses
  end
end
