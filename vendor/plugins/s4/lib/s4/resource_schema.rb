module S4
  
  class ResourceSchema < S4::Models::Base
    
    def self.find(resource_type)
      new(parse(call_with_session("s4.getResourceSchema", resource_type.to_param)))
    end
    
  private
  
    def self.parse(xml)
      Nokogiri::XML(xml).css("schema column").inject(ActiveSupport::OrderedHash.new) do |container, node|
        container[node.attribute('name').try(:content)] = node.content
        container
      end
    end
  
  end
  
end
