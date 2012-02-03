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
  
  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end

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