class Organizations::Contacts < Base
  
  column :fio
  column :firstname
  column :patronymic
  column :position
  column :phone_country_code, {:as => :hidden}
  column :phone_areacode, {:as => :hidden}
  column :phone_number, {:as => :hidden}
  column :phone_internal_number, {:as => :hidden}
  column :phone_display, {:as => :phonejs}
  column :fax_country_code, {:as => :hidden}
  column :fax_areacode, {:as => :hidden}
  column :fax_number, {:as => :hidden}
  column :fax_internal_number, {:as => :hidden}
  column :fax_display, {:as => :phonejs}
  column :email
  
  def initialize(*params)
    @change_alert = true
    super
  end
  
  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end

  validates_presence_of :fio, :firstname, :patronymic, :position, :phone_country_code, :phone_areacode, :phone_display, :phone_number, :phone_internal_number, :fax_country_code, :fax_areacode, :fax_display, :fax_number, :fax_internal_number, :email
    def self.human_attribute_name(attr)
    case attr
    when 'fio', 'firstname', 'patronymic', 'position', 'phone_country_code', 'phone_areacode', 'phone_display', 'phone_number', 'phone_internal_number', 'fax_country_code', 'fax_areacode', 'fax_display', 'fax_number', 'fax_internal_number', 'email'
      ''
    else
      super
    end
  end
end