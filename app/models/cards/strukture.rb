class Cards::Strukture < Base

  column :id_item, {:as => :hidden}
  column :namus_vou
  column :controllers_5per, {:as => :grid, :comment => true}, Cards::Grids::Strukture::Strukture.new
  
  column :kollegialorgan, {:as => :form}, Cards::Strukture::Kollegial_organ.new
  column :namus_kiou
  column :kollegia_list_2, {:as => :grid}, Cards::Grids::Strukture::Strukture_organa_ypravleniya.new
  
end