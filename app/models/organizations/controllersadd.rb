class Organizations::Controllersadd < Base

  column :id_item, {:as => :hidden}
  
  column :firstname
  column :surname
  column :patronymic
  column :comment1, {:as => :comment}
  column :position
  column :doc_name
  column :doc_number
  column :doc_date, {:as => :date}
  
  column :no_attestats, {:as => :hidden, :input_html => {:id => "", :value => "0"}}
  column :controllers, {:as => :grid, :empty_checkbox => :no_attestats}, Organizations::Grids::Controllers::Attestat.new

  def buttons
    [
      {:input => :submit},
      {:input => :button, :label =>'Назад', :onclick => "window.location = '/organization/ceo';return false;"}
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