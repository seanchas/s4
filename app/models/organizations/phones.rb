class Organizations::Phones < Base
  
  column :valuta, {:as => :grid }, Organizations::Grids::Phones::Phones_v.new
  column :fondovii, {:as => :grid }, Organizations::Grids::Phones::Phones_f.new
  column :srochnii, {:as => :grid }, Organizations::Grids::Phones::Phones_s.new
  column :cenii, {:as => :grid }, Organizations::Grids::Phones::Phones_c.new
end