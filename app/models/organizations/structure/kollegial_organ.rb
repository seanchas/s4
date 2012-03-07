class Organizations::Structure::Kollegial_organ < Base
  column :no_col_commitee, {:as => :boolean}
  #column :comment1, {:as => :comment}
  column :col_commitee_name, {:description => true}
  
  
  column :board_fio, {:group => :fio_group}
  column :board_firstname, {:group => :fio_group}
  column :board_patronymic, {:group => :fio_group}
  
  column :directors_committee, {:as => :grid}, Organizations::Grids::Structure::Structure_isponitelny_organ.new
end