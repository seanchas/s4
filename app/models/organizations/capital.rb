class Organizations::Capital < Base
  
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :auth_capital_vol
  column :auth_capital_vollit
  
  column :fully_paid, {:as => :boolean, :required => false}
  
  column :comment2, {:as => :comment}
  column :unpaid_auth_capital_vol, {:required => false}
  column :unpaid_auth_capital_vollit, {:required => false}
end