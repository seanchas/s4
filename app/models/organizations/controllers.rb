class Organizations::Controllers < Base
  
  column :controllers, {:as => :grid}, Organizations::Grids::Controllers::Controllers.new
end