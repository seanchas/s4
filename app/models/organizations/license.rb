class Organizations::License < Organizations::AbstractForm
  column :banking, {:as => :grid}, Organizations::Grids::Licenses::Banking.new
  column :professionalmember, {:as => :grid}, Organizations::Grids::Licenses::Professionalmember.new
  column :forwardmarket, {:as => :grid}, Organizations::Grids::Licenses::Forwardmarket.new
  column :other, {:as => :grid}, Organizations::Grids::Licenses::Other.new

  def initialize(*params)
    @change_alert = true
    super
  end
end