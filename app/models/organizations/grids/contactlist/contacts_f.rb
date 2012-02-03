class Organizations::Grids::Contactlist::Contacts_f < Base
  column :fio
  column :firstname
  column :patronymic
  column :position
  column :phone_areacode
  column :phone
  column :fax_areacode
  column :fax
  column :email
  
  def scope
    "grids.organizations.grids.contactlist.contacts_v"
  end

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