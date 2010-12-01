module Navigation
  
  class Controller

    attr_reader :proxy
    delegate :controller, :action, :to => :proxy
    
    def initialize(proxy, name, *actions)
      @proxy    = proxy
      @name     = name.to_s
      @actions  = actions.flatten.compact.uniq.collect(&:to_s)
    end
    
    def current?
      return true if @name == "all"
      @actions.include?("all") || @actions.include?(action) if @name == controller
    end
  
  end
  
end
