class Organizations::Circulation < Base
  
  column :name
  column :surname
  column :otchestvo
  
  column :code_town
  column :phone
  column :vnutrenii_nomer
  
  column :date, {:as => :date}
end