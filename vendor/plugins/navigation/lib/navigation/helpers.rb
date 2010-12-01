module Navigation
  
  module Helpers
    
    def self.included(base)
      base.class_eval do
        helper_method :navigation
      end
    end
    
    def navigation
      Navigation::Proxy.new(request)
    end
    
  end
  
end
