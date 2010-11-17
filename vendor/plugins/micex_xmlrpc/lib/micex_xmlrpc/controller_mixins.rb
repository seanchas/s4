module MicexXMLRPC
  
  module ControllerMixins
    
    def self.included(base)
      base.class_eval do
        before_filter :reload_xmlrpc_server
      end
    end

  protected
    
    def handle_xmlrpc_request
      response.headers['content-type'] = "text/xml; charset=utf-8"
      render :xml => MicexXMLRPC.server.process(request)
    end
    
    def xmlrpc_methods
      MicexXMLRPC.server.tasks
    end
    
    def reload_xmlrpc_server
      MicexXMLRPC.reload! unless Rails.configuration.cache_classes
    end
    
  end
  
end
