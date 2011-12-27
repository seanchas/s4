class Cards::Grids::Admin::Attestatinfo < Base

  column :serial
  column :number
  column :date_order, {:as =>:date}
  column :number_order
  column :date_certification, {:as =>:date}
  column :number_certification
  column :qualification, {:as => :checkboxes}

  def getActions(data)
    [
      {:label => :edit},
      {:label => :delete, :url => "/cards/delete/id/#{data["id_item"]}/"},
    ]
  end

  def addForm
    Cards::Adminadd.new
  end
end
