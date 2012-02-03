class RegCardExecutor < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :last_name, :firstname, :patronymic, :tel_areacode, :tel, :extension, :reg_card_date, :s4_id, :user
end