class Organizations::Capital < Organizations::AbstractForm
  
  column :id_item, {:as => :hidden}
  column :comment1, {:description => true, :as => :comment}
  column :auth_capital_vol
  
  column :fully_paid, {:as => :boolean, :required => false}
  
  column :comment2, {:as => :comment}
  column :unpaid_auth_capital_vol, {:required => false}
  
  def initialize(*params)
    @change_alert = true
    super
  end
end