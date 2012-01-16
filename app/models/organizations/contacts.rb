class Organizations::Contacts < Base
  
  column :fio
  column :firstname
  column :patronymic
  column :position
  column :phone_areacode
  column :phone
  column :fax_areacode
  column :fax
  column :email
  
  validates_presence_of :fio, :firstname, :patronymic, :position, :phone_areacode, :phone, :fax_areacode, :fax, :email
    def self.human_attribute_name(attr)
    case attr
    when 'fio', 'firstname', 'patronymic', 'position', 'phone_areacode', 'phone', 'fax_areacode', 'fax', 'email'
      ''
    else
      super
    end
  end
end