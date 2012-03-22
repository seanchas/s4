class SubscriptionController < OrganizationsController
  
  def index
    @organization = S4::Organization.find(s4_user)
    
    S4::Subscription.scope = {}
    @subscribe = S4::Subscription.find_with_scope(s4_user)
  end
end