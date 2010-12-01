class Warden::SessionSerializer
  
  def serialize(record)
    [record.class.name, record.id]
  end
  
  def deserialize(keys)
    record_class_name, record_id = keys
    record_class_name.constantize.find(record_id) rescue nil
  end
  
end
