class Organizations::Okvedadd < Base
  column :okved

  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end

  validates_presence_of :okved
  def self.human_attribute_name(attr)
    case attr
    when 'okved' 
      ''
    else
      super
    end
  end
end