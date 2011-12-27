class Phones < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :code_country, :code_operator, :phone_num, :osnovnoy, :fiovladelca, :dolzhnost, :catnum, :deportament, :user
end