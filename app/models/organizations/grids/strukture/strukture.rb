class Organizations::Grids::Strukture::Strukture < Base
  column :name
  column :dola
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end

  def addForm
    Organizations::Akcioner.new
  end
end