class Organizations::Licenseaddform < Base
  def self.licence_type_select()
    if !ApplicationHelper.s4_user.nil?
      ApplicationHelper.get_license_type nil
    else
      []
    end
  end

  def self.licence_organ_select()
    if !ApplicationHelper.s4_user.nil?
      ApplicationHelper.get_license_organ
    else
      []
    end
  end

  validates_presence_of :number, :licence_type, :licence_organ, :date_begin
  def self.human_attribute_name(attr)
    case attr
    when 'number', 'licence_type', 'licence_organ', 'subject', 'date_begin', 'date_end'
      ''
    else
      super
    end
  end
end

