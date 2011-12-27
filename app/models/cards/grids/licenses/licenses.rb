class Cards::Grids::Licenses::Licenses < Base
  column :number
  column :subject
  column :date_create, {:as =>:date}
  column :date_expired, {:as =>:date}
  column :typeof
  
  def scope
    "grids.cards.grids.licenses.banking"
  end
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Cards::Licenseaddform.new
  end
end