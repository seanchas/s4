class Organizations::Sbaadd < Base
  column :name, {:as => :text}

  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end

  validates_presence_of :name
  def self.human_attribute_name(attr)
    case attr
    when 'name' 
      ''
    else
      super
    end
  end
end