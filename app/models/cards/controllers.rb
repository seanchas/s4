class Cards::Controllers < Base
  
  column :controllers, {:as => :grid}, Cards::Grids::Admin::Controllers.new
end