class CreateRegCardExecutors < ActiveRecord::Migration
  def self.up
    create_table :reg_card_executors do |t|
	t.string :last_name
	t.string :firstname
	t.string :patronymic
	t.string :tel_areacode
	t.string :tel
	t.string :extension
	t.date :reg_card_date
	t.string :user
	t.integer :s4_id
    end
  end

  def self.down
    drop_table :reg_card_executors
  end
end
