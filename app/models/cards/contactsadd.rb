class Cards::Contactsadd < Base
  
  column :firstname
  column :secondname
  column :otchestvo
  
  column :dolzhnost
 
  column :code_phone
  column :phone
  
  column :code_fax
  column :fax
  
  column :email
  
  
  
  validates_presence_of :firstname, :secondname, :otchestvo, :dolzhnost, :code_phone, :phone, :code_fax, :fax, :email
    def self.human_attribute_name(attr)
    case attr
    when 'firstname', 'lastname', 'otchestvo', 'dolzhnost', 'code', 'phone', 'codetwo', 'fax', 'email'
      ''
    else
      super
    end
  end
end