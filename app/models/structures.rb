class Structures < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :id, :main_commitee_name, :col_commitee_name, :no_col_commitee, :board_fio, :board_firstname, :board_patronymic, :board_position, :executive_commitee_name, :user, :s4_id, :no_executive_commitee
end
