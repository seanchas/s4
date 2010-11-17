module MicexXMLRPC

  autoload :Server,           'micex_xmlrpc/server'
  autoload :Backend,          'micex_xmlrpc/backend'
  autoload :Controller,       'micex_xmlrpc/controller'
  autoload :ControllerMixins, 'micex_xmlrpc/controller_mixins'

  mattr_accessor :load_path
  @@load_path = []
  
  def self.server
    @@server ||= MicexXMLRPC::Server.new
  end
  
  def self.reload!
    @@server = nil
  end
  
end

ActionController::Base.extend MicexXMLRPC::Controller