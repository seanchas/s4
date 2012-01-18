class Organizations::Licenses::Professionalmemberaddform < Organizations::Licenseaddform
  column :number
  column :licence_type, {:as => :select}
  column :licence_organ, {:as => :select}
  column :date_begin, {:as => :date}
  column :date_end, {:as => :date, :required => false, :description => true}
  
  def get_licence_type_select
    get_licence_type 2
  end
end