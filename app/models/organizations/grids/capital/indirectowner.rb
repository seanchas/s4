class Organizations::Grids::Capital::Indirectowner < Base
  column :surname
  column :firstname
  column :patronymic
  column :share

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end
  def addForm
    Organizations::Indirectowner.new
  end
end