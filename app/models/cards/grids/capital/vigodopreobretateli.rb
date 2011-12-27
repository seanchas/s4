class Cards::Grids::Capital::Vigodopreobretateli < Base
  column :name
  column :number
  column :date, {:as => :date}

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  def addForm
    Cards::Vigodopreobretateli.new
  end
end