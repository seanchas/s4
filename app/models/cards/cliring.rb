class Cards::Cliring < Base
  
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :legal_countries, {:required => false}
  column :comment2, {:as => :comment}
  column :hidden_finance_countries, {:required => false}
  column :comment3, {:as => :comment}
  column :drugs_countries, {:required => false}
  
  
  column :scheta, {:as => :grid}, Cards::Grids::Cliring::Scheta.new
  
  column :comment4, {:as => :comment}
  column :comment5, {:as => :comment}
  column :firstname
  column :lastname
  column :otchestvo
  
  column :plavila_kontrolya, {:as => :boolean, :required => false}
  column :otvestv_za_pravila_kontrolya, {:as => :boolean, :required => false}
  column :id_client, {:as => :boolean, :required => false}
  column :obyaz_kontrol, {:as => :boolean, :required => false}
  column :obychenie_kadrov, {:as => :boolean, :required => false}
  
end