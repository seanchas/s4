module Navigation

  class Item
    
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    attr_reader :proxy, :name
    
    def initialize(proxy, name, title, url, *args, &block)
      @proxy  = proxy
      @name   = name
      @title  = title
      @url    = url
      
      process_args(*args)
    end
    
    def render(options = {})
      
      content = link_to @title, @url
      
      html_class = []
      html_class << :current  if current?
      html_class << :first    if options[:first]
      html_class << :last     if options[:last]
      html_class << options[:parity]
      html_class << @html_options.delete(:class)
      @html_options[:class] =  html_class.flatten.compact.collect(&:to_s).uniq.join(' ')
      
      content_tag name, content, @html_options
    end
    
    def current?
      @controllers.any?(&:current?)
    end

  protected
  
    def process_args(*args)
      options = args.extract_options!

      @html_options = (options.delete(:html) || {}).symbolize_keys!

      args.each { |name| options[name] = :all }
      @controllers = options.collect { |controller, *args| Navigation::Controller.new(proxy, controller, *args) }
    end
    
  end

end
