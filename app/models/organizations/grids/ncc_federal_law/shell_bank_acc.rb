class Organizations::Grids::Ncc_federal_law::Shell_bank_acc < Base
  column :name

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end
  
  def addForm
    Organizations::Sbaadd.new
  end
  
end