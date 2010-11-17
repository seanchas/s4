class OrganizationsController < ApplicationController
  
  def show
    @organization = S4::Organization.find("8")
  end
  
  def licenses
    @organization = S4::Organization.find("8")
    @licenses = S4::License.all("8")
  end
  
  def management
    @organization = S4::Organization.find("8")
    @ceo          = S4::CEO.find("8")
    @controllers  = S4::Controller.all("8")
    @signers      = S4::Signer.all("8")
  end
  
  def codes
    @organization = S4::Organization.find("8")
    @organization_codes = S4::OrganizationCodes.find("8")
  end
  
end
