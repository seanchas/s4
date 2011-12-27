class Cards::Adminadd < Base
  
  
  def self.qualification_select()
    [:brokerskaya_deyat ,:ypravl_cennimi_bumagami ,:depozitn_deyat ,:kollective_investition ,:paev_fond ,:pension_fond ,:organizaciya_torgovli ,:negos_pension_ford ,:emission_cennih_bumag ,:diller ,:cvet_bumaga ,:kliring]
  end
  
  
  def self.typeof_select()
    [:manager, :rukovod_sred_vish_zvena,:conroller, :spec]
  end
  
  
  column :serial
  column :number
  
  
  column :typeof, {:as => :checkboxes, :collection => Cards::Adminadd.typeof_select}
  column :qualification, {:as => :checkboxes, :collection => Cards::Adminadd.qualification_select}
  
  column :comment1, {:as => :comment}
  column :date_order, { :as => :date, :required => false}
  column :number_order, :required => false
  
  column :comment2, {:as => :comment}
  column :date_certification, {:as => :date, :required => false}
  column :number_certification, :required => false
  
  validates_presence_of :serial, :number, :typeof, :qualification
  def self.human_attribute_name(attr)
    case attr
    when 'serial', 'number', 'typeof', 'qualification'
      ''
    else
      super
    end
  end
end