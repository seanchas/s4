class Organizations::Grids::Capital::Profitercontract < Base
  column :name
  column :contract_number
  column :contract_date, {:as => :date}

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete},
    ]
  end
  def addForm
    Organizations::Profitercontract.new
  end
end