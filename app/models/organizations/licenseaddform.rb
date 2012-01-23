class Organizations::Licenseaddform < Organizations::Grids::GridStore
  validates_presence_of :number, :licence_type, :licence_organ, :date_begin

  def init_validation
    {:number => [:required],
     :licence_organ => [:required],
     :date_begin => [:required, 'validate-date'],
     :date_end => ['validate-date'],
     :licence_type => [:required],
    }
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

