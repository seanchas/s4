class Organizations::Controllers < Organizations::AbstractForm
  
  column :controllers, {:as => :grid}, Organizations::Grids::Controllers::Controllers.new

  def initialize(*params)
    @change_alert = true
    super
  end
end