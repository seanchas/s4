module Passport
  module Strategies
    
    class Base < Warden::Strategies::Base
      
      def warden
        request.env['warden']
      end
      
    end
    
  end
end
