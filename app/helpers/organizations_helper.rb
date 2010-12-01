module OrganizationsHelper
  
  def contextual_menu
    navigation.ul :html => { :id => :contextual_menu, :class => :tabbed_menu } do |ul|
      ul.li t(:information, :scope => [:organizations, :contextual_menu]), organization_path,             :organizations => :show
      ul.li t(:licenses,    :scope => [:organizations, :contextual_menu]), licenses_organization_path,    :organizations => :licenses
      ul.li t(:management,  :scope => [:organizations, :contextual_menu]), management_organization_path,  :organizations => :management
    end
  end
  
end
