class Cards::Grids::Phones::Phones_f < Base
  column :code_country
  column :code_operator
  column :phone_num
  column :osnovnoy
  column :fiovladelca
  column :dolzhnost
  column :catnum
  
  def rowset 
     Phones.find_all_by_deportament('fondovii')
  end
  
  def getActions(data)
    [
      {:label => :edit, :action => "edit", :options => {:confirm => "XXXX???"}},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Cards::Phonesadd.new
  end
end