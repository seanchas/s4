class Organizations::Grids::Phones::Phones_f < Organizations::Grids::GridStore
  column :country, {:as => :select}
  column :operator
  column :number
  column :main, {:as => :select, :collection => Organizations::Phonesadd.main}
  column :fio
  column :position
  column :alert_phone_category, {:as => :select}
  
  def rowset 
     Phones.find_all_by_kind('fondovii')
  end
  
  def getActions(data)
    [
      {:label => :edit, :action => "edit", :options => {:confirm => "XXXX???"}},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  
  def addForm
    Organizations::Phonesadd.new
  end
end