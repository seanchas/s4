module MicexXMLRPC
  
  class Backend
    
    class BackendError < StandardError
    end
    
    class NamespaceMissingError < BackendError
    end
    
    class MethodBodyMissingError < BackendError
    end
    
    attr_reader :tasks

    def initialize
      @tasks = []
      MicexXMLRPC.load_path.flatten.each do |filename|
        eval(IO.read(filename), nil, filename)
      end
    end
    
  private
    
    def help(help)
      @help = help
    end
    
    def signature(*signature)
      @signature = signature
    end
    
    def task(name, &block)
      raise NamespaceMissingError unless @namespace.present?
      raise MethodBodyMissingError unless block_given?
      tasks << Task.new(@namespace, name, @signature, @help, &block)
      cleanup
    end
    
    def namespace(name, &block)
      @namespace = name
      instance_eval(&block)
    end
    
    def cleanup
      @description  = nil
      @signature    = nil
    end
    
    
    class Task
      
      attr_reader :signatures, :help, :block
      
      def initialize(namespace, name, signatures = nil, help = nil, &block)
        @namespace    = namespace
        @name         = name
        @signatures   = signatures
        @help         = help
        @block        = block
      end
      
      def id
        @id ||= [@namespace, @name].join(".")
      end
      
    end
    
    
  end
  
end
