class Organizations::Ceo < Base
  
  column :id_item, {:as => :hidden}
  
  column :comment1, {:as => :comment}
  
  column :firstname
  column :surname
  column :patronymic
  column :position
  
  column :comment2, {:as => :comment}
  column :doc_name
  column :doc_number
  column :doc_date, {:as => :date}

  column :certificates, {:as => :grid}, Organizations::Grids::Controllers::Attestat.new
  
  column :comment3, {:as => :comment}
  
  column :organs_in_place, {:as => :boolean}
  column :organs_place_other
end