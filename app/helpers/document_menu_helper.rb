module DocumentMenuHelper
  
  def contextual_menu
    navigation.ul :html => { :id => :contextual_menu, :class => :tabbed_menu } do |ul|
      ul.li t(:header, :scope => [:shared, :senddocument]), list_senddocuments_path,             :senddocuments => :list
      ul.li t(:header_message, :scope => [:shared, :senddocument]), message_senddocuments_path,     :senddocuments => :message
      ul.li t(:header_document, :scope => [:shared, :senddocument]), form_senddocuments_path,     :senddocuments => :form
    end
  end

end
