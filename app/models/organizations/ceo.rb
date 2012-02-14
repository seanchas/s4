class Organizations::Ceo < Base
  
  column :id_item, {:as => :hidden}
  
  column :firstname, {:group => :fio_group}
  column :surname, {:group => :fio_group}
  column :patronymic, {:group => :fio_group}
  column :position
  
  column :doc_name, {:group => :document_group}
  column :doc_number, {:group => :document_group}
  column :doc_date, {:as => :date, :group => :document_group}

  column :no_attestats, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :certificates, {:as => :grid, :empty_checkbox => :no_attestats}, Organizations::Grids::Controllers::Attestat.new
  
  column :organs_in_place, {:as => :boolean, :group => :supplier_group}
  column :organs_place_other, {:group => :supplier_group}
end