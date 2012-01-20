module S4
  
  class License < S4::Resource
    self.resource_type = :licence

    def date_begin=(date)
      attributes["date_begin"] = date.to_date
    end
    
    def date_end=(date)
      attributes["date_end"] = date.present? ? date.to_date : nil
    end

    def self.create_xml(rowset)
      resources = []
      gridStore = Organizations::Grids::GridStore.new
      licence_organ = gridStore.get_licence_organ_select
      licence_type = gridStore.get_licence_type nil
  
      cnt = 1
      rowset.collect do |row|
        properties = []
        toParse = row.attributes.select {|i, k| !['id', 'user'].include?(i)}
        toParse << ['id', "#{(-1 * cnt)}"]
        toParse.collect do |col, value|
          attrs =
          case col
            when 'date_begin', 'date_end' then
              value = value.to_date.strftime("%FT%T") if value != '' && !value.nil?
              {:name => col}
            when 'licence_type', 'licence_organ', 'kind' then
              vv = value
              value = licence_organ.select {|v, k| k == value}.first.first if col == 'licence_organ'
              value = licence_type.select {|v, k| k == value}.first.first if col == 'licence_type'
              if col == 'kind'
                value = S4::LicenceKind.getKindIdByName(value)
                vv = value
                licenceKinds = S4::LicenceKind.all(Organizations::Grids::GridStore.s4_user)
                value = licenceKinds.select {|k, v| k.id == vv.to_s}.first
                value = value.title if !value.nil?
                col = "licence_kind"
              end
              {:name => col, :ref_id => vv, :ref_resource => col}
          else
            {:name => col}
          end
          properties << {:attrs => attrs, :value => value}
        end
        cnt+=1
        resources << {:properties => properties}
      end
      S4::Card.build_xml('licence', resources)
    end
  end

end
