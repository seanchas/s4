class Organizations::Grids::Structure::Structure < Base
  column :name
  column :share
  
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