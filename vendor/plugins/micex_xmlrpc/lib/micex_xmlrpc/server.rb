require 'xmlrpc/server'

module MicexXMLRPC
  
  class Server < XMLRPC::BasicServer
    
    def initialize(*args)
      super
      add_introspection
      add_handlers
    end
    
    def process(request)
      super(request.body)
    end
    
    def tasks
      @tasks ||= @handler.collect do |name, task, signature, help|
        Task.new(name, signature, help)
      end
    end
  
  private
  
    def add_handlers
      backend.tasks.each do |task|
        add_handler(task.id, task.signatures, task.help, &task.block)
      end
    end
    
    def backend
      @backend ||= MicexXMLRPC::Backend.new
    end
    
    
    class Task
      
      attr_accessor :id, :signature, :help
      
      def initialize(id, signature, help)
        @id         = id
        @signature  = signature
        @help       = help
      end
      
      def signatures
        @signatures ||= if signature.nil?
          [id]
        elsif signature.first.is_a?(Array)
          signature.collect { |s| ["#{s.first} #{id}(#{s[1, s.size].join(", ")})"] }
        else
          ["#{signature.first} #{id}(#{signature[1, signature.size].join(", ")})"]
        end
      end
      
    end
    
    
  end
  
end
