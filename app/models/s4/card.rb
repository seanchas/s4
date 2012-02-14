module S4
  
  class Card < S4::Resource
    
    self.resource_type = :reg_card

    def self.create_common_xml(type, rowset, fields = [], exclude = false)
      resources = []
      rowset.collect do |row|
        resources << {:properties => self.get_properties(row, fields, exclude)}
      end
      build_xml type, resources
    end
    
    def self.create_common_single_xml(type, row, fields = [], exclude = false)
      properties = {}
      properties = self.get_properties(row, fields, exclude) if !row.nil?
      build_single_xml type, properties
    end
    
    def self.build_single_xml(type, properties)
      self.build_xml type, [{:properties => properties}]
    end # build_single_xml
    
    def self.build_xml(type, resources)
      builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.resources {
          resources.each do |r|
            xml.resource :type => type do 
              r[:properties].each do |p|
                prop = xml.property p[:attrs] do 
                  xml.cdata(p[:value].to_s) if !p[:value].nil?
                end
              end
            end #resource
          end
        }
      end
      builder.doc.xpath('//resources').first['disabled'] = 'true' if resources.length == 0
      builder.to_xml.to_s.gsub(/^<\?xml[^>]*>(.*)\n/m, '\1')
    end # build_xml
    
private
    def self.get_properties(row, fields, exclude = false)
      properties = []
      attrs = row.attributes
      attrs.delete('id')
      if row.respond_to?('s4_id')
        attrs['id'] = row.s4_id.nil? ? -1 * row.id.to_i : row.s4_id 
        attrs.delete('s4_id')
      end

      toParse = attrs.select do |i, k|
        exclude == !fields.include?(i)
      end

      toParse.collect do |col, value|
        attrs = {:name => col}
        #value = value ? 1 : 0 if !!value == value

        case row.class.columns_hash[col.to_s].type
          when :boolean, 'boolean'
            value = value ? 1 : 0
          when :date, 'date'
            value = value.to_date.strftime("%FT%T")
        end if !value.nil?

        attrs[:disabled] = 'true' if value.nil?
        properties << {:attrs => attrs, :value => value}
      end
      properties
   end
  end 
end
