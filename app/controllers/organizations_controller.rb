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
	
	def manager
		@organization = S4::Organization.find(s4_user)
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)
		@documentList = S4.connection.call("s4.getResource", @sessionId, 'personal_manager', s4_user)
    @documentList = S4::Resource.parse_many(@documentList)

		#@personal_managers = S4::PersonalManager.all_with_scope(s4_user)
		#@pm_attr = @personal_managers.find('attributes')
	
	
	  @documentList.each do |column|
	    if ['photo_base64'] == ""
	      column["photo_base64"] = '/images/manager_photos/nophoto.png'
		  else
		    base_64_encoded_data2 = column["photo_base64"].gsub("<br/>","")
	      File.open('public/images/manager_photos/managerId_' + column["id"] + '.jpg', 'wb') do|f|
			    f.write(Base64.decode64(base_64_encoded_data2))
		    end
		    column["photo_base64"] = '/images/manager_photos/managerId_' + column["id"] + '.jpg'
		  end
	  end

	end
  
end
