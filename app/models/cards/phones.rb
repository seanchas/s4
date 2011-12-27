class Cards::Phones < Base
  
  column :valuta, {:as => :grid }, Cards::Grids::Phones::Phones_v.new
  column :fondovii, {:as => :grid }, Cards::Grids::Phones::Phones_f.new
  column :srochnii, {:as => :grid }, Cards::Grids::Phones::Phones_s.new
  column :cenii, {:as => :grid }, Cards::Grids::Phones::Phones_c.new
end