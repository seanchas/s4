class Cards::Grids::Cliring::Scheta < Base
  column :name

  def getActions(data)
    [
      {:label => :edit, :url => ''},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Cards::Cliringschetadd.new
  end
  
end