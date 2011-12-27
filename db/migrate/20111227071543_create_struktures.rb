class CreateStruktures < ActiveRecord::Migration
  def self.up
    create_table :struktures do |t|
      t.string :namus_vou
      t.string :namus_kou
      t.string :ystav_view
      t.string :firstname
      t.string :lastname
      t.string :otchestvo
      t.string :dolzhnost
      t.string :namus_kiou
      t.string :user
    end
  end

  def self.down
    drop_table :struktures
  end
end
