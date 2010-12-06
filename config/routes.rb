ActionController::Routing::Routes.draw do |map|

  map.root :controller => :welcome

  map.xmlrpc "/xml-rpc", :controller => :welcome, :action => :xmlrpc

  map.resource :organization, :only => :show, :member => { :licenses => :get, :management => :get, :codes => :get }
  
  map.resources :markets

  map.resources :documents
  
  map.resources :cards

end
