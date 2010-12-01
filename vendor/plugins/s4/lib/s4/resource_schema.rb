module S4
  
  class ResourceSchema < S4::Models::Base
    
    def self.find(resource_type)
      new(call_with_session("s4.getResourceSchema", resource_type.to_param))
    end
    
    def initialize(xml)
      @elements = []
      parse(xml)
    end
    
    def columns
      @columns ||= @elements.select { |element| element.is_a?(Column) } + @elements.select { |element| element.is_a?(Group) }.collect(&:columns).flatten
    end
    
    def each(&block)
      @elements.each(&block)
    end
    
  private
  
    def parse(xml)
      xml = xml.is_a?(String) ? Nokogiri::XML(xml) : xml
      @elements = xml.css("schema > column, schema > group").collect do |node|
        case node.name
          when 'column'
            Column.new(node)
          when 'group'
            Group.new(node)
        end
      end
    end


    class Group
      
      attr_reader :title, :columns
      
      def initialize(xml)
        @columns = []
        parse(xml)
      end
      
      def title?
        !title.blank?
      end
      
      def element_type
        :group
      end
    
    private
    
      def parse(xml)
        @title    = xml.attribute("name").try(:content)
        @columns  = xml.css("column").collect { |node| Column.new(node) }
      end
      
    end
    
    
    class Column
      
      attr_reader :name, :type, :title, :nowrap
      
      def initialize(xml)
        parse(xml)
      end

      def element_type
        :column
      end
      
      def nowrap?
        !!nowrap
      end
    
    private
    
      def parse(xml)
        @name   = xml.attribute("name").try(:content)
        @type   = xml.attribute("type").try(:content)
        @nowrap = xml.attribute("nowrap").try(:content)
        @title  = xml.content
      end
      
    end
    
  
  end
  
end
