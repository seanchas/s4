class Filials < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :adres, :code_town, :phone, :firstname, :lastname, :otchestvo, :dolzhnost, :moscow, :kolvo, :user
end