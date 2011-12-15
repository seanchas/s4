class Formvoting < ActiveRecord::BaseWithoutTable
  
  column :average,     :string
  column :user_id,     :string
  column :note,        :string
  
  validates_presence_of :average, :user_id, :note
  
  def self.human_attribute_name(attr)
    case attr
    when 'average'
      ''
    when 'user_id'
      ''
    when 'note'
      ''
    else
      super
    end
  end
end