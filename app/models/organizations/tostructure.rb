class Organizations::Tostructure < Base
  
  column :surname
  column :firstname
  column :patronymic
  
  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end
  
  validates_presence_of :surname, :firstname, :patronymic
  def self.human_attribute_name(attr)
    case attr
    when 'surname', 'firstname', 'patronymic'
      ''
    else
      super
    end
  end
end