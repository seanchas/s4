class Organizations::Licenseaddform < Organizations::Grids::GridStore
  validates_presence_of :number, :licence_type, :licence_organ, :date_begin

  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end

  def self.human_attribute_name(attr)
    case attr
    when 'number', 'licence_type', 'licence_organ', 'subject', 'date_begin', 'date_end'
      ''
    else
      super
    end
  end
end

