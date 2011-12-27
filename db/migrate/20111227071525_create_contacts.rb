class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :firstname
      t.string :secondname
      t.string :otchestvo
      t.string :dolzhnost
      t.string :code_phone
      t.string :phone
      t.string :code_fax
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
