module Navigation
  
  class Proxy
    
    def initialize(request)
      @request = request
    end
    
    def controller
      @request.params[:controller]
    end
    
    def action
      @request.params[:action]
    end
    
    def method_missing(name, *args, &block)
      Navigation::Container.new(self, name, *args, &block)
    end
    
  end
  
end
