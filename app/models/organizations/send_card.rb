class Organizations::SendCard < Base
  column :comment1, {:as => :comment, :i18n => {:doc_form => I18n.t(:menu_title, :scope => [:shared, :sendmessages])}}
  column :last_name
  column :firstname
  column :patronymic
  column :tel_areacode
  column :tel
  column :extension, {:required => false}
  column :reg_card_date, {:as => :date}
  
  def buttons
    [
      {:input => :button, :label => I18n.t(:send_card_button, :scope => [:formtastic, :labels, :organizations, :sendcard]), :onclick => 'this.form.submit();return false;'}
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