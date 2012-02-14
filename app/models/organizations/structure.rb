class Organizations::Structure < Base

  column :id_item, {:as => :hidden}
  column :main_commitee_name, {:description => true}
  
  column :no_shareholder, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :shareholder, {:as => :grid, :comment => true, :empty_checkbox => :no_shareholder}, Organizations::Grids::Structure::Structure.new

  column :directors_committee, {:as => :form}, Organizations::Structure::Kollegial_organ.new

  column :executive_commitee_name, {:group => :group1, :description => true}
  column :no_executive_commitee, {:as => :hidden, :input_html => {:id => "", :value => "0"}, :group => :group1}
  column :direction, {:as => :grid, :group => :group1, :empty_checkbox => :no_executive_commitee}, Organizations::Grids::Structure::Structure_organa_ypravleniya.new
  
end