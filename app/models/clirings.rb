class Clirings < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :legal_countries, :hidden_finance_countries, :drugs_countries, :firstname, :lastname, :otchestvo, :plavila_kontrolya, :otvestv_za_pravila_kontrolya, :id_client, :obyaz_kontrol, :obychenie_kadrov, :id, :user
end
