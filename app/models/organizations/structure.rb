class Organizations::Structure < Organizations::AbstractForm

  column :id_item, {:as => :hidden}
  column :main_commitee_name, {:description => true}
  
  column :no_shareholder, {:as => :norender}
  column :shareholder, {:as => :grid, :comment => true}, Organizations::Grids::Structure::Structure.new

  column :directors_committee, {:as => :form}, Organizations::Structure::Kollegial_organ.new

  column :no_executive_commitee, {:as => :boolean, :group => :directors_committee_executive, :required => false}
  column :executive_commitee_name, {:group => :directors_committee_executive, :description => true}
  
  column :direction, {:as => :grid, :group => :directors_committee_executive}, Organizations::Grids::Structure::Structure_organa_ypravleniya.new
  
  def initialize(*params)
    @change_alert = true
    super
  end
end