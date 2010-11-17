ActionController::Routing::Routes.draw do |map|

  map.root :controller => :welcome

  map.xmlrpc "/xml-rpc", :controller => :welcome, :action => :xmlrpc

  map.resource :organization, :member => { :licenses => :get, :management => :get, :codes => :get }

end
