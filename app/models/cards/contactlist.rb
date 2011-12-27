class Cards::Contactlist < Base
  
  column :valuta, {:as => :grid }, Cards::Grids::Contactlist::Contacts_v.new
  column :fondovii, {:as => :grid }, Cards::Grids::Contactlist::Contacts_f.new
  column :srochnii, {:as => :grid }, Cards::Grids::Contactlist::Contacts_s.new
  column :cenii, {:as => :grid }, Cards::Grids::Contactlist::Contacts_c.new
end