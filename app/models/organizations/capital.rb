class Organizations::Capital < Base
  
  column :id_item, {:as => :hidden}
  column :comment1, {:as => :comment}
  column :auth_capital_vol
  column :auth_capital_vollit
  
  column :fully_paid, {:as => :boolean, :required => false}
  
  column :comment2, {:as => :comment}
  column :unpaid_auth_capital_vol, {:required => false}
  column :unpaid_auth_capital_vollit, {:required => false}
  
  
  column :indirect_owner, {:as => :grid}, Organizations::Grids::Capital::Indirectowner.new
  column :no_indirect_owners, {:as => :boolean}

  column :profiter_contract, {:as => :grid}, Organizations::Grids::Capital::Profitercontract.new
  column :no_ncc_profiters, {:as => :boolean}
end