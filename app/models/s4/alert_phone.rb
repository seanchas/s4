module S4
  
  class AlertPhone < S4::Resource
    
    self.resource_type = :alert_phone
    def self.create_xml(rowset)
      resources = []
      cnt = 1
      gridStore = Organizations::Grids::GridStore.new
      alert_phone_category = gridStore.get_alert_phone_category_select
      countries = gridStore.get_country_select
      contactGroups = S4::ContactGroup.all(Organizations::Grids::GridStore.s4_user)
      coutry = gridStore.get_country_select
      
      rowset.collect do |row|
        properties = []

        toParse = row.attributes.select {|i, k| !['id', 'user'].include?(i)}
        toParse << ['id', "#{(-1 * cnt)}"]
        toParse.collect do |col, value|
          attrs = 
          case col
            when 'alert_phone_category', 'country' then
              vv = value
              value = alert_phone_category.select {|v, k| k == value}.first.first if col == 'alert_phone_category'
              value = countries.select {|v, k| k == value}.first.first if col == 'country'
              {:name => col, :ref_id => vv, :ref_resource => col}
            when 'kind' then
              value = S4::ContactGroup.getKindIdByName(value)
              vv = value
              value = contactGroups.select {|k, v| k.id == vv.to_s}.first
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
      S4::Card.build_xml('alert_phone', resources)
    end
  end
  
end
