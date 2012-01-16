class Organizations::Phonesadd < Base

  def self.code_country()
    if !ApplicationHelper.s4_user.nil?
      ApplicationHelper.get_country
    else
      []
    end
  end

  def self.main()
    [[I18n.t(:no_word, :scope => [:formtastic]), '0'], [I18n.t(:yes_word, :scope => [:formtastic]), '1']]
  end
  
  def self.phone_category()
    if !ApplicationHelper.s4_user.nil?
      ApplicationHelper.get_alert_phone_category
    else
      []
    end
  end
  
  column :country, {:as => :select, :collection => Organizations::Phonesadd.code_country}
  column :operator
  column :number
  column :main, {:as => :select, :collection => Organizations::Phonesadd.main}
  column :fio
  column :position
  column :alert_phone_category, {:as => :select, :collection => Organizations::Phonesadd.phone_category}
  
  validates_presence_of :country, :operator, :number, :main, :fio, :position, :alert_phone_category
  def self.human_attribute_name(attr)
    case attr
    when 'country', 'operator', 'number', 'main', 'fio', 'position', 'alert_phone_category'
      ''
    else
      super
    end
  end
end