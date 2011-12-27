class Cards::Grids::Phones::Phones_s < Base
  column :code_country
  column :code_operator
  column :phone_num
  column :osnovnoy
  column :fiovladelca
  column :dolzhnost
  column :catnum
  
  def rowset 
     Phones.find_all_by_deportament('srochnii')
  end
  
  def getActions(data)
    [
      {:label => :edit, :url => ''},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Cards::Phonesadd.new
  end
end