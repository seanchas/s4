class Organizations::Tostructure < Base
  
  column :surname
  column :firstname
  column :patronymic
  
  
  validates_presence_of :surname, :firstname, :patronymic
  def self.human_attribute_name(attr)
    case attr
    when 'surname', 'firstname', 'patronymic'
      ''
    else
      super
    end
  end
end