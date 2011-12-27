class Cards::Grids::Cliring::Phones < Base
  column :code_country
  column :code_operator
  column :phone_num
  column :osnovnoy
  column :fiovladelca
  column :dolzhnost
  column :catnum
  
  def rowset 
     [{"code_country" => "1", "code_operator" => "","phone_num" => "","osnovnoy" => "","fiovladelca" => "","dolzhnost" => "", "catnum" => ""},
      {"code_country" => "1", "code_operator" => "","phone_num" => "","osnovnoy" => "","fiovladelca" => "","dolzhnost" => "", "catnum" => ""},
      {"code_country" => "1", "code_operator" => "","phone_num" => "","osnovnoy" => "","fiovladelca" => "","dolzhnost" => "", "catnum" => ""},]
  end
  
  def getActions(data)
    [
      {:label => :edit, :url => ''},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
end