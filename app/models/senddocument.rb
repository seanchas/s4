class Senddocument < ActiveRecord::BaseWithoutTable
  
  column :type_id,  :string
  column :document, :string
  column :text, :string
  
  validates_presence_of :type_id, :document
  
  def self.human_attribute_name(attr)
    case attr
    when 'document'
      ''
    when 'text'
      ''
    else
      super
    end
  end
end