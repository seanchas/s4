module CardsHelper
  def contextual_menu
    # main menu
    menu = navigation.ul :html => { :id => :contextual_menu, :class => [:tabbed_menu, :level1].join(' ')} do |ul|
      ul.li(t(:index, :scope => [:cards, :contextual_menu]), cards_path,             :cards => :index)
      ul.li(t(:sendcard, :scope => [:cards, :contextual_menu]), sendcard_cards_path, :cards => :sendcard)
      ul.li t(:sendtomarket, :scope => [:cards, :contextual_menu]), form_senddocuments_path,     :senddocuments => :form
    end
    
    content_tag :div, menu, {:id => "dropdownmenu"}
  end
end
