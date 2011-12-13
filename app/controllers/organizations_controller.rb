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
	
  def starbox
        
    pmid = params[:identity]
    pmid = pmid[4..-1]
    
    rated = params[:rated]
    
    scope = {
      'personal_manager_id' => pmid,
      'rating' => rated,
      'note' => ''
    }
    
    S4::PersonalManagerRating.scope = scope
    S4::PersonalManagerRating.set_with_scope(s4_user)
        
    render :text => scope.inspect
  end
  
	def manager
		@organization = S4::Organization.find(s4_user)
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)
		@documentList = S4.connection.call("s4.getResource", @sessionId, 'personal_manager', s4_user)
    @documentList = S4::Resource.parse_many(@documentList)

		#@personal_managers = S4::PersonalManager.all_with_scope(s4_user)
		#@pm_attr = @personal_managers.find('attributes')
    
    @documentList.each do |column|
     
      S4::PersonalManagerRating.scope = {'personal_manager_id' => column["id"]}
      @pm_rating = S4::PersonalManagerRating.find_with_scope(s4_user).attributes
      
      if @pm_rating["rating"].nil?
        column["rating"] = 0
      else 
        column["rating"] = @pm_rating["rating"]
      end
        
	    if column['photo_base64'] == ""
	      column["photo_base64"] = '/upload/no_photo.jpeg'
		  else
		    if ( column["photo_file_name"].slice("jpg") == "jpg")
		      fileExist = "jpg"
		    elsif ( column["photo_file_name"].slice("gif") == "gif")
		      fileExist = "gif"
		    elsif ( column["photo_file_name"].slice("png") == "png")
		      fileExist = "png"
		    elsif ( column["photo_file_name"].slice("jpeg") == "jpeg")
		      fileExist = "jpeg"
		    end
		         
		    
		    base_64_encoded_data2 = column["photo_base64"].gsub("<br/>","")
	      File.open(RAILS_ROOT + '/public/upload/managerId_' + column["id"] + '.' + fileExist, 'wb') do|f|
			    f.write(Base64.decode64(base_64_encoded_data2))
		    end
		    column["photo_base64"] = '/upload/managerId_' + column["id"] + '.' + fileExist
		  end
	  end

	end
  
end
