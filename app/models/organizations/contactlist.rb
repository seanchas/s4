class Organizations::Contactlist < Base
  
  column :valuta, {:as => :grid }, Organizations::Grids::Contactlist::Contacts_v.new
  column :fondovii, {:as => :grid }, Organizations::Grids::Contactlist::Contacts_f.new
  column :srochnii, {:as => :grid }, Organizations::Grids::Contactlist::Contacts_s.new
  column :cenii, {:as => :grid }, Organizations::Grids::Contactlist::Contacts_c.new
end