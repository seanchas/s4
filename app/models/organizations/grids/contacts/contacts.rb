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
  
  def rowset 
     [{"firstname" => "Онотоле", "secondname" => "Вотерман", "otchestvo" => "Михалыч", "dolzhnost" => "SuperUser", "code_phone" => "831", "phone" => "2620202", "code_fax" => "831","fax" => "2620022", "email" => "onotole@waterman@.com" },
      {"firstname" => "Онотоле", "secondname" => "Вотерман", "otchestvo" => "Михалыч", "dolzhnost" => "SuperUser", "code_phone" => "831", "phone" => "2620202", "code_fax" => "831","fax" => "2620022", "email" => "onotole@waterman@.com" },
      {"firstname" => "Онотоле", "secondname" => "Вотерман", "otchestvo" => "Михалыч", "dolzhnost" => "SuperUser", "code_phone" => "831", "phone" => "2620202", "code_fax" => "831","fax" => "2620022", "email" => "onotole@waterman@.com" },]
  end
  
  def addForm
    Organizations::Contactsadd.new
  end
end