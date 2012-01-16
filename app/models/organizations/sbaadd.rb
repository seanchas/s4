class Organizations::Sbaadd < Base
  
  column :name, {:as => :text}
  
  validates_presence_of :name
  def self.human_attribute_name(attr)
    case attr
    when 'name' 
      ''
    else
      super
    end
  end
end