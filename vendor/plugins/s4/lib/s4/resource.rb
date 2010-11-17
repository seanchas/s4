module S4
  
  class Resource < S4::Models::Base
    
    def self.all(param)
      parse_many(call_with_session("s4.listResources", resource_type.to_param, param.to_param)).collect { |attributes| new(attributes) }
    end
    
    def self.find(param)
      new(parse_one(call_with_session("s4.getResource", resource_type.to_param, param.to_param)))
    end
    
    def self.resource_type=(resource_type)
      @resource_type = resource_type.is_a?(S4::ResourceType) ? resource_type : S4::ResourceType.find(resource_type)
    end
    
    def self.resource_type
      @resource_type
    end
    
    def self.schema
      resource_type.schema
    end
    
    def self.label(name)
      schema.send(name)
    end
    
  private

    def self.parse_many(xml)
      xml = xml.is_a?(String) ? Nokogiri::XML(xml) : xml
      xml.css("resource").collect do |node|
        parse_one(node)
      end
    end
  
    def self.parse_one(xml)
      xml = xml.is_a?(String) ? Nokogiri::XML(xml) : xml
      xml.css("property").inject(ActiveSupport::OrderedHash.new) do |container, node|
        container[node.attribute("name").try(:content)] = node.content
        container
      end
    end
    
  end
  
end
