class Cards::Grids::Admin::Controllersadd < Base
  
  column :lastname
  column :firstname
  column :otchestvo
  column :dolzhnost
  column :docum_o_naznach
  column :number
  column :date, {:as => :date}
  
  column :attestatInfo, {:as => :grid}, Cards::Grids::Admin::Attestatinfo.new
end