module CreateDocumentMenuHelper
  
  def contextual_menu
    navigation.ul :html => { :id => :contextual_menu, :class => :tabbed_menu } do |ul|
      ul.li t(:header, :scope => [:shared, :authority]), authorities_path,  :authorities => :index
      ul.li t(:withdraw, :scope => [:shared, :authority]), withdraw_create_authorities_path, :authorities => :withdraw_create
    end
  end

end
