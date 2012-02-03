ActionController::Routing::Routes.draw do |map|

  map.root :controller => :welcome

  map.xmlrpc "/xml-rpc", :controller => :welcome, :action => :xmlrpc

  map.resource :organization, :only => :show, :member => {
    :news => :get,
    :notice => :get,
    :messages => :get,
    :management => :get, 
    :manager => :get, 
    :codes => :get, 
    :starbox => :post,

    :licenses => :get,
    :licensessave => :post,
    :ceo => :get,
    :adminadd => :get,
    :ceo_new => :post,
    :controllers => :get,
    :controllersadd => :get,
    :structure => :get,
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
    :structureedit => :post,
    :controlleraddsave => :post,
    :controllereditsave => :post,
    :controllersedit => :get,
    :controllersdelete => :get,
    :ncc_federal_law_edit => :post,
    :ncc_federal_law => :get,
    :sendcard => :get,
    :sendcardsave => :post,
    :organizationsave => :post,
    :reset => :get
  }
  
  map.resources :markets

  map.resources :documents
  
  map.resources :cards, :collection => {
    :sendcard => :get,
    :sendcardsave => :post
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
