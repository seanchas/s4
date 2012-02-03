class Organizations::Grids::Structure::Structure < Base
  column :name
  column :share
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end

  def addForm
    Organizations::Akcioner.new
  end
end