class Cards::License < Base
  
  column :banking, {:as => :grid}, Cards::Grids::Licenses::Banking.new
  column :professionalmember, {:as => :grid}, Cards::Grids::Licenses::Professionalmember.new
  column :forwardmarket, {:as => :grid}, Cards::Grids::Licenses::Forwardmarket.new
  column :other, {:as => :grid}, Cards::Grids::Licenses::Other.new
end