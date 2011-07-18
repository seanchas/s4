class OrganizationsController < ApplicationController
  
  helper :members_menu
  
  def show
    @organization = S4::Organization.find(s4_user)
  end
  
  def licenses
    @organization = S4::Organization.find(s4_user)
    @licenses = S4::License.all(s4_user)
  end
  
  def management
    @organization = S4::Organization.find(s4_user)
    @ceo          = S4::CEO.find(s4_user)
    @controllers  = S4::Controller.all(s4_user)
    @signers      = S4::Signer.all(s4_user)
  end
  
end
