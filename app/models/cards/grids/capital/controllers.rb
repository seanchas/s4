class Cards::Grids::Capital::Controllers < Base
  column :familia
  column :name
  column :otchestvo
  column :dolya

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  def addForm
    Cards::Capitalcontrollers.new
  end
end