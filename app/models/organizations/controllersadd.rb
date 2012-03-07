class Organizations::Controllersadd < Organizations::AbstractForm

  column :id_item, {:as => :hidden}
  
  column :surname
  column :firstname
  column :patronymic
  column :position

  column :doc_name, {:group => :position_group}
  column :doc_number, {:group => :position_group}
  column :doc_date, {:as => :date, :group => :position_group}
  
  column :no_attestats, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :controllers, {:as => :grid, :empty_checkbox => :no_attestats}, Organizations::Grids::Controllers::Attestat.new

  def initialize(*params)
    @change_alert = true
    super
  end

  def buttons
    [
      {:input => :submit},
      {:input => :button, :label =>'Назад', :onclick => "window.location = '/organization/controllers';return false;"}
    ]
  end
  
  validates_presence_of :firstname, :surname, :patronymic, :position, :doc_name, :doc_number, :doc_date
  def self.human_attribute_name(attr)
    case attr
    when 'firstname', 'surname', 'patronymic', 'position', 'doc_name', 'doc_number', 'doc_date' 
      ''
    else
      super
    end
  end
end