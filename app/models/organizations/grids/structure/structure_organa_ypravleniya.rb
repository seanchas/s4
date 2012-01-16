class Organizations::Grids::Structure::Structure_organa_ypravleniya < Base
  
  column :surname
  column :firstname
  column :patronymic
 
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end

  def addForm
    Organizations::Tostructure.new
  end
end