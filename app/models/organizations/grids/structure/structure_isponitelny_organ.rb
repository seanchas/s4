class Organizations::Grids::Structure::Structure_isponitelny_organ < Base
  
  column :surname
  column :firstname
  column :patronymic
 
  def scope
    "grids.organizations.grids.structure.structure_organa_ypravleniya"
  end
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