module CreateDocumentMenuHelper
  
  def contextual_menu
    navigation.ul :html => { :id => :contextual_menu, :class => :tabbed_menu } do |ul|
      ul.li t(:header, :scope => [:shared, :authority]), authorities_path,  :authorities => :index
      ul.li t(:withdraw, :scope => [:shared, :authority]), withdraws_path, :withdraws => :index
    end
  end

end
