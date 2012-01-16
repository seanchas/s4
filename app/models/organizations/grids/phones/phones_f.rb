class Organizations::Grids::Phones::Phones_f < Base
  column :country, {:as => :select, :collection => Organizations::Phonesadd.code_country}
  column :operator
  column :number
  column :main, {:as => :select, :collection => Organizations::Phonesadd.main}
  column :fio
  column :position
  column :alert_phone_category, {:as => :select, :collection => Organizations::Phonesadd.phone_category}
  
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