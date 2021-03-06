class Organizations::Grids::Licenses::Professionalmember < Organizations::Grids::GridStore
  column :number
  column :licence_organ, {:as => :select}
  column :date_begin, {:as =>:date}
  column :date_end, {:as =>:date}
  column :licence_type, {:as => :select}
  
  def get_licence_type_select
    get_licence_type 2
  end
  
  def get_licence_organ_select
    get_licence_organ 2
  end

  def scope
    "grids.organizations.grids.licenses.banking"
  end
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end
  
  def addForm
    Organizations::Licenses::Professionalmemberaddform.new
  end
end