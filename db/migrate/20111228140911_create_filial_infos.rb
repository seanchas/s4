class CreateFilialInfos < ActiveRecord::Migration
  def self.up
    create_table :filial_infos do |t|
      t.string :filial_num
      t.string :moscow_addr
      t.string :moscow_tel_areacode
      t.string :moscow_tel
      t.string :moscow_boss
      t.string :moscow_boss_firstname
      t.string :moscow_boss_patronymic
      t.string :moscow_boss_position
      t.boolean :no_moscow
      t.string :user
    end
  end

  def self.down
    drop_table :filial_infos
  end
end
