ActionController::Routing::Routes.draw do |map|

  map.root :controller => :welcome

  map.xmlrpc "/xml-rpc", :controller => :welcome, :action => :xmlrpc

  map.resource :organization, :only => :show, :member => { :licenses => :get, :management => :get, :manager => :get, :codes => :get, :starbox => :post }
  
  map.resources :markets

  map.resources :documents
  
  map.resources :cards, :collection => {
    :licenses => :get,
    :licensessave => :post,
    :admin => :get,
    :adminadd => :get,
    :admincreate => :post,
    :controllers => :get,
    :controllersadd => :get,
    :strukture => :get,
    :capital => :get,
    :capitalsave => :post,
    :cliring => :get,
    :filials => :get,
    :filialscreate => :post,
    :phones => :get,
    :phonesadd => :get,
    :contactlist => :get,
    :contactsadd => :get,
    :contactsnew => :post,
    :circulation => :get,
    :phonenew => :post,
    :struktureedit => :post,
    :controlleraddsave => :post,
    :controllereditsave => :post,
    :controllersedit => :get,
    :controllersdelete => :get,
    :cliringsave => :post
  }
  
  map.formvalidate "/formvalidate", :controller => :welcome, :action => :formvalidate

  map.resources :reports
   
  map.resources :senddocuments, :collection => {
    :list => :get,
    :message => :get,
    :form => :get,
    :warrant => :get,
    :list_filter => :post
  }
  map.resources :authorities
  
  #map.insider     "/insider", :controller => :insiders, :action => :new,    :conditions => { :method => :get }
  #map.rat_insider "/insider", :controller => :insiders, :action => :create, :conditions => { :method => :post }
end
