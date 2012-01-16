class Organizations::Structure < Base

  column :id_item, {:as => :hidden}
  column :main_commitee_name
  column :shareholder, {:as => :grid, :comment => true}, Organizations::Grids::Structure::Structure.new
  column :directors_committee, {:as => :form}, Organizations::Structure::Kollegial_organ.new
  column :executive_commitee_name
  column :direction, {:as => :grid}, Organizations::Grids::Structure::Structure_organa_ypravleniya.new
  column :no_executive_commitee, {:as => :boolean}
end