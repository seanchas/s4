class Cards::Filials < Base
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :adres, {:required => false}
  
  column :code_town, {:required => false}
  column :phone, {:required => false}
  
  column :firstname, {:required => false}
  column :lastname, {:required => false}
  column :otchestvo, {:required => false}
  column :dolzhnost, {:required => false}
  
  column :moscow, {:as => :boolean, :required => false}
  
  column :kolvo
end