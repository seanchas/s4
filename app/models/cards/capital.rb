class Cards::Capital < Base
  
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :ciframi
  column :podpis
  
  column :oplachen_polnost, {:as => :boolean, :required => false}
  
  column :comment2, {:as => :comment}
  column :ciframi_chast, {:required => false}
  column :podpis_chast, {:required => false}
  
  column :controllers, {:as => :grid}, Cards::Grids::Capital::Controllers.new
  column :vigodopreobretateli, {:as => :grid}, Cards::Grids::Capital::Vigodopreobretateli.new
end