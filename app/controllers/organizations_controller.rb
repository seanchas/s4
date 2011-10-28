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
    @documentList = S4.connection.call("s4.getResource", @sessionId, 'personal_manager', "76831d27-6daf-44af-bb73-a72875e9a04f")
    @documentList = S4::Resource.parse_many(@documentList)
    
  
    base_64_encoded_data = "R0lGODlhUAAPAKIAAAsLav///88PD9WqsYmApmZmZtZfYmdakyH5BAQUAP8ALAAAAABQAA8AAAPb
WLrc/jDKSVe4OOvNu/9gqARDSRBHegyGMahqO4R0bQcjIQ8E4BMCQc930JluyGRmdAAcdiigMLVr
ApTYWy5FKM1IQe+Mp+L4rphz+qIOBAUYeCY4p2tGrJZeH9y79mZsawFoaIRxF3JyiYxuHiMGb5KT
kpFvZj4ZbYeCiXaOiKBwnxh4fnt9e3ktgZyHhrChinONs3cFAShFF2JhvCZlG5uchYNun5eedRxM
AF15XEFRXgZWWdciuM8GCmdSQ84lLQfY5R14wDB5Lyon4ubwS7jx9NcV9/j5+g4JADs="
    
    
    File.open('public/images/manager_photos/shipping_label.gif', 'wb') do|f|
      f.write(Base64.decode64(base_64_encoded_data))
    end

  end
  
end
