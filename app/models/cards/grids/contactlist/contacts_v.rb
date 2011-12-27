class Cards::Grids::Contactlist::Contacts_v < Base
  column :firstname
  column :secondname
  column :otchestvo
  column :dolzhnost
  column :code_phone
  column :phone
  column :code_fax
  column :fax
  column :email
  
  def rowset
     Contacts.find_all_by_deportament('valuta')
  end
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Cards::Contacts.new
  end
end