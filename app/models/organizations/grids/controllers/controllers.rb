class Organizations::Grids::Controllers::Controllers < Base
  
  column :surname
  column :firstname
  column :patronymic
  column :position
  column :doc_name
  column :doc_number
  column :doc_date

  def getActions(data)
    [
      {:label => :edit, :url => "/organization/controllersedit/?id=#{data["id"]}"},
      {:label => :delete, :url => "/organization/controllersdelete/?id=#{data["id"]}"},
    ]
  end
end