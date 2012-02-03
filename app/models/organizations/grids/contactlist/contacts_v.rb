class Organizations::Grids::Contactlist::Contacts_v < Base
  column :fio
  column :firstname
  column :patronymic
  column :position
  column :phone_areacode
  column :phone
  column :fax_areacode
  column :fax
  column :email
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end
  
  def addForm
    Organizations::Contacts.new
  end
end