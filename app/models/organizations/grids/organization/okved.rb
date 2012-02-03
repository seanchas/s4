class Organizations::Grids::Organization::Okved < Base
  column :okved

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end
  
  def addForm
    Organizations::Okvedadd.new
  end
  
  
end