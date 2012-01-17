class Organizations::Licenses::Professionalmemberaddform < Organizations::Licenseaddform
  def self.licence_type_select()
    if !ApplicationHelper.s4_user.nil?
      ApplicationHelper.get_license_type 2
    else
      []
    end
  end
  column :number
  column :licence_type, {:as => :select, :collection => Organizations::Licenses::Professionalmemberaddform.licence_type_select}
  column :licence_organ, {:as => :select, :collection => Organizations::Licenseaddform.licence_organ_select}
  column :date_begin, {:as => :date}
  column :date_end, {:as => :date, :required => false, :description => true}
end