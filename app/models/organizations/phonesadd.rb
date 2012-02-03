class Organizations::Phonesadd < Organizations::Grids::GridStore
  def self.main()
    [[I18n.t(:no_word, :scope => [:formtastic]), '0'], [I18n.t(:yes_word, :scope => [:formtastic]), '1']]
  end
  
  column :country, {:as => :select}
  column :operator
  column :number
  column :main, {:as => :select, :collection => Organizations::Phonesadd.main}
  column :fio
  column :position
  column :alert_phone_category, {:as => :select}
  
  
  def buttons
    [
      {:input => :submit},
      {:input => :button, :label => ::Formtastic::I18n.t(:grid_cancel, :scope => [:buttons]), :class => "grid_cancel"}
    ]
  end

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