class Authority < ActiveRecord::BaseWithoutTable
  
  column :type_id,     :string
  column :user_id,     :string
  column :lastname,    :string
  column :firstname,   :string
  column :middlename,  :string
  column :position,    :string
  
  validates_presence_of :type_id
  
  def self.human_attribute_name(attr)
    case attr
    when 'lastname'
      ''
    when 'firstname'
      ''
    when 'middlename'
      ''
    when 'position'
      ''
    else
      super
    end
  end
end