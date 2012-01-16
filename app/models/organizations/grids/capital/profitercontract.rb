class Organizations::Grids::Capital::Profitercontract < Base
  column :name
  column :contract_number
  column :contract_date, {:as => :date}

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["number"]}/"},
    ]
  end
  def addForm
    Organizations::Profitercontract.new
  end
end