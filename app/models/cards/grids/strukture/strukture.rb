class Cards::Grids::Strukture::Strukture < Base
  column :name
  column :dola
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end

  def addForm
    Cards::Akcioner.new
  end
end