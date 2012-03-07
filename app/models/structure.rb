class Structure < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :id, :main_commitee_name, :col_commitee_name, :no_col_commitee, :board_fio, :board_firstname, :board_patronymic, :executive_commitee_name, :user, :s4_id, :no_executive_commitee, :no_shareholder
  has_many :struktures_controls, :foreign_key => "parent_id", :dependent => :destroy
  has_many :struktures_shareholders, :foreign_key => "parent_id", :dependent => :destroy
end
