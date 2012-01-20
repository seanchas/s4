class Organizations::Licenses::Forwardmarketaddform < Organizations::Licenseaddform
  column :number
  column :licence_type, {:as => :select}
  column :licence_organ, {:as => :select}
  column :date_begin, {:as => :date}
  column :date_end, {:as => :date, :required => false, :description => true}

  def get_licence_type_select
    get_licence_type 3
  end

  def get_licence_organ_select
    get_licence_organ 3
  end
end