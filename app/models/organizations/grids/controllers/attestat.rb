class Organizations::Grids::Controllers::Attestat < Base

  column :series
  column :number
  column :ekz_date, {:as =>:date}
  column :ekz_number
  column :att_date, {:as =>:date}
  column :att_number
  column :qualification, {:as => :checkboxes}

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["id_item"]}/"},
    ]
  end

  def addForm
    Organizations::Attestatadd.new
  end
end
