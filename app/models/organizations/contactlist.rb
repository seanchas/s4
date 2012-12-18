class Organizations::Contactlist < Organizations::AbstractForm
  column :no_contact_valuta, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :valuta, {:as => :grid, :empty_checkbox => :no_contact_valuta}, Organizations::Grids::Contactlist::Contacts_v.new
  
  column :no_contact_fondovii, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :fondovii, {:as => :grid, :empty_checkbox => :no_contact_fondovii}, Organizations::Grids::Contactlist::Contacts_f.new
  
  column :no_contact_srochnii, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :srochnii, {:as => :grid, :empty_checkbox => :no_contact_srochnii}, Organizations::Grids::Contactlist::Contacts_s.new
  
  column :no_contact_cenii, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :cenii, {:as => :grid, :empty_checkbox => :no_contact_cenii}, Organizations::Grids::Contactlist::Contacts_c.new

end