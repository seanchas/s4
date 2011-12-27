class Cards::Grids::Strukture::Strukture_isponitelny_organ < Base
  
  column :firstname
  column :lastname
  column :middlename
 
  def scope
    "grids.cards.grids.strukture.strukture_organa_ypravleniya"
  end
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end

  def addForm
    Cards::Tostrukture.new
  end
end