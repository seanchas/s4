class Cards::Controllersadd < Base

  column :id_item, {:as => :hidden}
  
  column :lastname
  column :firstname
  column :middlename
  column :position
  column :comment1, {:as => :comment}
  column :documentName
  column :documentNumber
  column :documentDate, {:as => :date}
  
  column :controllers, {:as => :grid}, Cards::Grids::Admin::Attestatinfo.new
  
  def buttons
    [
      {:input => :submit},
      {:input => :button, :label =>'Назад', :onclick => "window.location = '/cards/controllers';return false;"}
    ]
  end
end