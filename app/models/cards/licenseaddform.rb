class Cards::Licenseaddform < Base

  def self.typeof_select()
    d = {"first" => "111111", "second" => "222222", "third" => "33333333"}
  end

  def self.subject_select()
    d = {"subject first" => "fffffffff", "subject second" => "gggggggggggggg", "subject third" => "hhhhhhhhhhh"}
  end

  column :number
  column :typeof, {:as => :select, :collection => Cards::Licenseaddform.typeof_select}
  column :subject, {:as => :select, :collection => Cards::Licenseaddform.subject_select}
  column :date_create, {:as => :date}
  column :date_expired, {:as => :date, :required => false, :description => true}

  validates_presence_of :number, :typeof, :subject, :date_create
  def self.human_attribute_name(attr)
    case attr
    when 'number', 'typeof', 'subject', 'subject', 'date_create', 'date_expired'
      ''
    else
      super
    end
  end
end