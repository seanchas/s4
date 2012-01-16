module S4
  
  class Contact < S4::Resource
    
    self.resource_type = :contact
    
    def self.create_xml(rowset)
      resources = []
      cnt = 1
      rowset.collect do |row|
        properties = []
  
        toParse = row.attributes.select {|i, k| !['id', 'user'].include?(i)}
        toParse << ['id', "#{(-1 * cnt)}"]
        toParse.collect do |col, value|
          attrs = 
          case col
            when 'kind' then
              value = S4::ContactGroup.getKindIdByName(value)
              vv = value
              licenceKinds = S4::ContactGroup.all(ApplicationHelper.s4_user)
              value = licenceKinds.select {|k, v| k.id == vv.to_s}.first
              value = value.title if !value.nil?
              {:name => 'contact_group', :ref_id => vv, :ref_resource => 'contact_group'}
          else
            {:name => col}
          end
          
          value = value ? 1 : 0 if !!value == value
          
  
          attrs[:disabled] = 'true' if value.nil?
          properties << {:attrs => attrs, :value => value}
        end
        cnt+=1
        resources << {:properties => properties}
      end
      S4::Card.build_xml('contact', resources)
    end
  end
  
end
