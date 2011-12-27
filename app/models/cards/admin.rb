class Cards::Admin < Base
  
  column :id_item, {:as => :hidden}
  
  column :comment1, {:as => :comment}
  column :lastname
  column :firstname
  column :middlename
  column :comment2, {:as => :comment}
  column :position
  column :documentName
  column :documentDate, {:as => :date}
  column :documentNumber 
  
  column :attestatInfo, {:as => :grid}, Cards::Grids::Admin::Attestatinfo.new
  column :comment3, {:as => :comment}
  column :place, {:as => :boolean}
end