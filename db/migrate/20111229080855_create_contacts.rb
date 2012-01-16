class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :fio
      t.string :firstname
      t.string :patronymic
      t.string :position
      t.string :tel_areacode
      t.string :tel
      t.string :fax_areacode
      t.string :fax
      t.string :email
      t.string :deportament
      t.string :user
    end
  end

  def self.down
    drop_table :contacts
  end
end
