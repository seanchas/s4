module Warden
  module Mixins
    module Common
      
      def request
        @request ||= env['action_controller.rescue.request']
      end
      
      def response
        @response ||= env['action_controller.rescue.response']
      end
      
    end
  end
end
