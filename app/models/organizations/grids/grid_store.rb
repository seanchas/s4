class Organizations::Grids::GridStore < Base
  cattr_accessor :s4_user

  def s4_user
    Organizations::Grids::GridStore.s4_user
  end

  def parse_collection(v)
    collection = v.collect do |l|
      [l.attributes['name'], l.attributes['id']]
    end
    collection
  end
  
  # licenses
  def get_licence_type(license_type)
    if !license_type.nil?
      S4::LicenceType.scope = {'licence_kind' => license_type}
      parse_collection S4::LicenceType.all_with_scope(s4_user)
    else
      parse_collection S4::LicenceType.all(s4_user)
    end
  end

#  def get_licence_organ_select()
#    parse_collection S4::LicenceOrgan.all(s4_user)
#  end

  def get_licence_organ(license_type)
    if !license_type.nil?
      S4::LicenceOrgan.scope = {:licence_kind => license_type}
      parse_collection S4::LicenceOrgan.all_with_scope(s4_user)
    else
      parse_collection S4::LicenceOrgan.all(s4_user)
    end
  end
  
  # phones
  def get_alert_phone_category_select
    parse_collection S4::AlertPhoneCategory.all(s4_user)
  end
  
  def get_country_select
    parse_collection S4::Country.all(s4_user)
  end
end