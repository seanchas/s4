class User < PassportModel
  
  passport
  
  has_one :s4_relation

  def s4_key
    s4_relation.try(:s4_key)
  end

  def full_name
    @full_name ||= [last_name, first_name, middle_name].compact.join(' ')
  end

  def screen_name
    @screen_name ||= full_name.blank? ? nickname : full_name
  end
  
end
