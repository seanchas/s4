module S4
  
  class ContactGroup < S4::Resource
    
    self.resource_type = :contact_group
    
    def self.getKindById(group_id)
      @@kinds[group_id.to_s]
    end

    def self.getKindIdByName(kind_name)
      res = @@kinds.select {|k, v| v.include? kind_name }.first
      res[0]
    end
  private
    @@kinds = {'12' => 'valuta', '1' => 'fondovii', '2' => 'srochnii', '8' => 'cenii'}
  end
  
end
