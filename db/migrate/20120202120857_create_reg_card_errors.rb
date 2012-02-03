class CreateRegCardErrors < ActiveRecord::Migration
  def self.up
    create_table :reg_card_errors do |t|
      t.text  :common_errors, :limit => 4294967295
      t.text  :show, :limit => 4294967295
      t.text  :licenses, :limit => 4294967295
      t.text  :ceo, :limit => 4294967295
      t.text  :controllers, :limit => 4294967295
      t.text  :structure, :limit => 4294967295
      t.text  :capital, :limit => 4294967295
      t.text  :filials, :limit => 4294967295
      t.text  :ncc_federal_law, :limit => 4294967295
      t.text  :phones, :limit => 4294967295
      t.text  :sendcard, :limit => 4294967295
      t.text  :contactlist, :limit => 4294967295
      t.string :user
    end
  end

  def self.down
    drop_table :reg_card_errors
  end
end
