class Cards::Grids::Admin::Controllers < Base
  
  column :lastname
  column :firstname
  column :middlename
  column :position
  column :documentName
  column :documentDate
  column :documentNumber

  def getActions(data)
    [
      {:label => :edit, :url => "/cards/controllersedit/?id=#{data["id"]}"},
      {:label => :delete, :url => "/cards/controllersdelete/?id=#{data["id"]}"},
    ]
  end
end