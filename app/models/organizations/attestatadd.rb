class Organizations::Attestatadd < Base
  
  
  def self.qualification_select()
    [:b, :u, :dep, :reg, :ki, :f, :torg, :spec, :emi, :d, :du, :clear]
  end
  
  
  def self.activity_select()
    [:r, :rvs, :k, :s]
  end
  
  
  column :series
  column :number
  
  
  column :activity, {:as => :checkboxes, :collection => Organizations::Attestatadd.activity_select}
  column :qualification, {:as => :checkboxes, :collection => Organizations::Attestatadd.qualification_select}
  
  column :comment1, {:as => :comment}
  column :ekz_date, { :as => :date, :required => false}
  column :ekz_number, :required => false
  
  column :comment2, {:as => :comment}
  column :att_date, {:as => :date, :required => false}
  column :att_number, :required => false

  validates_presence_of :series, :number, :activity, :qualification
  def self.human_attribute_name(attr)
    case attr
    when 'series', 'number', 'activity', 'qualification'
      ''
    else
      super
    end
  end
end