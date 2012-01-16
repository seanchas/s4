class Organizations::Grids::Ncc_federal_law::Shell_bank_acc < Base
  column :name

  def getActions(data)
    [
      {:label => :edit, :url => ''},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Organizations::Sbaadd.new
  end
  
end