class Organizations::Grids::Structure::Structure_organa_ypravleniya < Base
  
  column :surname
  column :firstname
  column :patronymic
 
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end

  def addForm
    Organizations::Tostructure.new
  end
end