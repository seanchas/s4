module Navigation
  
  class Container
    
    include ActionView::Helpers::TagHelper
    
    attr_reader :proxy, :name, :items
    
    def initialize(proxy, name, *args, &block)
      @proxy  = proxy
      @name   = name
      @items  = []

      process_args(*args)
      
      yield(self) if block_given?
    end
    
    def to_s
      return '' if items.empty?

      content = items.collect do |item|
        item.render(:first => item == items.first, :last => item == items.last, :parity => [:even, :odd][items.index(item) % 2])
      end.join

      content_tag name, content, @html_options
    end
    
    def method_missing(name, *args, &block)
      @items << Navigation::Item.new(proxy, name, *args, &block)
    end
    
  protected

    def process_args(*args)
      options = args.extract_options!

      @html_options = (options.delete(:html) || {}).symbolize_keys!
    end

  end
  
end
