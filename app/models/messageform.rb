class Messageform < ActiveRecord::BaseWithoutTable
  column :theme,    :string
  column :text,   :string
  
  validates_presence_of :theme, :text
  
  def self.human_attribute_name(attr)
    case attr
    when 'theme'
      ''
    when 'text'
      ''
    else
      super
    end
  end
end
