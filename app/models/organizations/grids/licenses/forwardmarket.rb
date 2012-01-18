class Organizations::Grids::Licenses::Forwardmarket < Organizations::Grids::GridStore
  column :number
  column :licence_organ, {:as => :select}
  column :date_begin, {:as =>:date}
  column :date_end, {:as =>:date}
  column :licence_type, {:as => :select}

  def get_licence_type_select
    get_licence_type 3
  end

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
    Organizations::Licenses::Forwardmarketaddform.new
  end
end