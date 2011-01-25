module S4
  
  class ResourceType < S4::Models::Base
    
    def self.all
      Rails.cache.fetch("S4::ResourceTypes", :expires_in => 1.minute) do
        parse(call_with_session("s4.listResourceTypes")).collect { |node| new(node) }
      end
    end
    
    def self.find(param)
      all.detect { |resource_type| resource_type.to_param == param.to_param }
    end
    
    def schema
      @schema ||= S4::ResourceSchema.find(to_param)
    end
    
    def to_param
      id.to_s
    end
  
  private
  
    def self.parse(xml)
      Nokogiri::XML(xml).css("resource_types resource_type").collect do |node|
        {
          :id     => node.attribute('id').try(:content),
          :title  => node.content
        }
      end
    end
    
  end
  
end
