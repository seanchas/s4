class Cards::Phonesadd < Base
  
  def self.typeof_select()
    d = {"first" => "111111", "second" => "222222", "third" => "33333333"}
  end
  
  def self.subject_select()
    d = {"subject first" => "fffffffff", "subject second" => "gggggggggggggg", "subject third" => "hhhhhhhhhhh"}
  end
  
  column :code_country, {:as => :select, :collection => Cards::Licenseaddform.typeof_select}
  column :code_operator
  column :phone_num
  
  column :osnovnoy, {:as => :select, :collection => Cards::Licenseaddform.subject_select}
  column :fiovladelca, {:as => :select, :collection => Cards::Licenseaddform.typeof_select}
  
  column :dolzhnost
  column :catnum
end