class Organizations::Akcioner < Base
  
  column :name
  column :share
  
  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end
  
  validates_presence_of :name, :share
  def self.human_attribute_name(attr)
    case attr
    when 'name', 'share'
      ''
    else
      super
    end
  end
end