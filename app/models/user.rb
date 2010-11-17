class User < PassportModel
  
  has_one :s4_relation

  def s4_key
    s4_relation.try(:s4_key)
  end
  
end
