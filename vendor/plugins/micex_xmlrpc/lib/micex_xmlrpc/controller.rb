module MicexXMLRPC
  
  module Controller
    
    def serve_xmlrpc(*args)
      include MicexXMLRPC::ControllerMixins
    end
    
  end
  
end
