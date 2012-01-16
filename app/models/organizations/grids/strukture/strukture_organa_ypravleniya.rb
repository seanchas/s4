class Organizations::Grids::Strukture::Strukture_organa_ypravleniya < Base
  
  column :firstname
  column :lastname
  column :middlename
 
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end

  def addForm
    Organizations::Tostrukture.new
  end
end