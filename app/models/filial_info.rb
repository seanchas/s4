class FilialInfo < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :filial_num, :moscow_addr, :moscow_tel_areacode, :moscow_tel_display, :moscow_tel_country_code, :moscow_tel_number, :moscow_tel_internal_number, :moscow_boss, :moscow_boss_firstname, :moscow_boss_patronymic, :moscow_boss_position, :no_moscow, :s4_id, :user
end