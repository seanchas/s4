class Cards::SendCard < Base
  column :item_id, {:as => :hidden}
  column :comment1, {:as => :comment, :i18n => {:textilize => true, :doc_form => I18n.t(:menu_title, :scope => [:shared, :sendmessages])}}
  column :last_name, {:group => :group1}
  column :firstname, {:group => :group1}
  column :patronymic, {:group => :group1}
  column :tel_areacode, {:group => :group1}
  column :tel, {:group => :group1}
  column :extension, {:required => false, :group => :group1}
  column :reg_card_date, {:as => :date}
  
  def buttons
    [
      {:input => :button, :label => I18n.t(:send_card_button, :scope => [:formtastic, :labels, :cards, :sendcard]), :onclick => 'this.form.submit();return false;'}
    ]
  end

  validates_presence_of :last_name, :firstname, :patronymic, :tel_areacode, :tel, :reg_card_date
  def self.human_attribute_name(attr)
    case attr
    when 'last_name', 'firstname', 'patronymic', 'tel_areacode', 'tel', 'reg_card_date'
      ''
    else
      super
    end
  end
end