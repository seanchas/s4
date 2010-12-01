require 'monitor'

module S4
  module Utils
    
    class SessionTimeoutError < StandardError
    end
    
    class SessionPool
      
      def initialize
        @sessions     = []
        @reserved     = {}
        @checked_out  = []
        
        @mutex = Monitor.new
      end
      
      def pull_session
        @reserved[current_session_id] ||= checkout
      end
      
      def push_session
        session = @reserved.delete(current_session_id)
        checkin(session) if session
      end
      
      def checkout
        @mutex.synchronize do
          session = if @checked_out.size < @sessions.size
            checkout_existing_session
          else
            checkout_new_session
          end
        end
      end
      
      def checkin(session)
        @mutex.synchronize do
          @checked_out.delete(session)
        end
      end
    
    private
    
      def current_session_id
        Thread.current.object_id
      end
      
      def checkout_new_session
        session = open_session
        @sessions << session
        check_out_session(session)
      end
      
      def checkout_existing_session
        session = (@sessions - @checked_out).first
        close_session(session) and return checkout_new_session unless check_session(session)
        check_out_session(session)
      end
      
      def check_out_session(session)
        @checked_out << session
        session
      end
      
      def open_session
        S4.connection.call("s4.openSession", I18n.locale)
      end
      
      def check_session(session)
        S4.connection.call("s4.checkSession", session)
      end
      
      def close_session(session)
        @sessions.delete(session)
        S4.connection.call("s4.closeSession", session)
      end
    
    end


    class SessionManagement

      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      ensure
        S4.session_pool.push_session
      end

    end

  end
  
end
