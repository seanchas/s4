module S4
  module Utils
    
    class Manager
      
      def initialize(app, options = {}, &block)
        @app = app
      end
      
      def call(env)
        @app.call(env)
      end
      
    end
    
  end
end
