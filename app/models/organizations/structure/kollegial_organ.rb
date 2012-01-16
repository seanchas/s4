class Organizations::Structure::Kollegial_organ < Base
  column :comment1, {:as => :comment}
  column :col_commitee_name
  column :no_col_commitee, {:as => :boolean}
  
  column :board_fio
  column :board_firstname
  column :board_patronymic
  column :board_position
  
  column :directors_committee, {:as => :grid}, Organizations::Grids::Structure::Structure_isponitelny_organ.new
end