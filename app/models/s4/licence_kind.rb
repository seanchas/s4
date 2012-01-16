module S4
  
  class LicenceKind < S4::Resource
    
    self.resource_type = :licence_kind
    
    def self.getKindById(type_id)
      @@kinds[type_id.to_s]
    end
    
    def self.getKindIdByName(kind_name)
      res = @@kinds.select {|k, v| v.include? kind_name }.first
      res[0]
    end
  
  private
    @@kinds = {'1' => 'banking', '2' => 'professionalmember', '3' => 'forwardmarket', '4' => 'other'}
  end
  
end
