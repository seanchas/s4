class Cards::Strukture::Kollegial_organ < Base
  column :comment1, {:as => :comment}
  column :namus_kou
  column :ystav_view, {:as => :boolean}
  
  column :firstname
  column :lastname
  column :otchestvo
  column :dolzhnost
  
  column :kollegia_list_1, {:as => :grid}, Cards::Grids::Strukture::Strukture_isponitelny_organ.new
end