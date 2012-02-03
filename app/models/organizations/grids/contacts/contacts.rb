class Organizations::Grids::Contacts::Contacts < Base
  column :firstname
  column :secondname
  column :otchestvo
  column :dolzhnost
  column :code_phone
  column :phone
  column :code_fax
  column :fax
  column :email
  
  def addForm
    Organizations::Contactsadd.new
  end
end