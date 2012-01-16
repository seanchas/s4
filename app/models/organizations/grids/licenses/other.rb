class Organizations::Grids::Licenses::Other < Base
  column :number
  column :licence_organ, {:as => :select, :collection => Organizations::Licenseaddform.licence_organ_select}
  column :date_begin, {:as =>:date}
  column :date_end, {:as =>:date}
  column :licence_type, {:as => :select, :collection => Organizations::Licenses::Otheraddform.licence_type_select}
  
  def scope
    "grids.organizations.grids.licenses.banking"
  end
  
  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Organizations::Licenses::Otheraddform.new
  end
end