class CreateRegCardErrors < ActiveRecord::Migration
  def self.up
    create_table :reg_card_errors do |t|
      t.text  :common_errors, :limit => 16777215
      t.text  :show, :limit => 16777215
      t.text  :licenses, :limit => 16777215
      t.text  :ceo, :limit => 16777215
      t.text  :controllers, :limit => 16777215
      t.text  :structure, :limit => 16777215
      t.text  :capital, :limit => 16777215
      t.text  :filials, :limit => 16777215
      t.text  :ncc_federal_law, :limit => 16777215
      t.text  :phones, :limit => 16777215
      t.text  :sendcard, :limit => 16777215
      t.text  :contactlist, :limit => 16777215
      t.string :user
    end
  end

  def self.down
    drop_table :reg_card_errors
  end
end
