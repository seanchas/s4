class Organizations::Profitercontract < Base
  column :name
  column :contract_number
  column :contract_date, {:as => :date}
  
  validates_presence_of :name, :contract_number, :contract_date
  def self.human_attribute_name(attr)
    case attr
    when 'name', 'contract_number', 'contract_date' 
      ''
    else
      super
    end
  end
end