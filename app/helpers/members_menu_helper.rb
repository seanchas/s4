module MembersMenuHelper

  def auxiliary_menu
    navigation.ul :html => { :class => :tabbed_menu, :id => :auxiliary_menu } do |ul|
      ul.li t(:title, :scope => :organizations),                organization_path,  :organizations
      ul.li t(:title, :scope => :markets),                      markets_path,       :markets
      ul.li t(:title, :scope => :documents),                    documents_path,     :documents
      ul.li t(:title, :scope => :cards),                        cards_path,         :cards
      ul.li t(:title, :scope => :reports),                      reports_path,       :reports
      #ul.li t(:title, :scope => :tradereports),                 '/backoffice/private/',         :tradereports
      ul.li t(:create_document, :scope => :authorities),        '/authorities', :authorities => :index, :withdraws => :index
      ul.li t(:menu_title, :scope => [:shared, :senddocument]), list_senddocuments_path, :authorities => :list, :senddocuments => [:form, :list, :message]
    end if s4_user
  end

end