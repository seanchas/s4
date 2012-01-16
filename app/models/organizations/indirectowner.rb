class Organizations::Indirectowner < Base
  column :surname
  column :firstname
  column :patronymic
  column :share
  
  validates_presence_of :surname, :firstname, :patronymic, :share
  def self.human_attribute_name(attr)
    case attr
    when 'surname', 'firstname', 'patronymic', 'share' 
      ''
    else
      super
    end
  end
end