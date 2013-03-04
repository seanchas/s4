ActionController::Routing::Routes.draw do |map|
  map.root :controller => :welcome

  map.xmlrpc "/xml-rpc", :controller => :welcome, :action => :xmlrpc

  map.resource :tradereports, :only => :show, :member => {
      :download => :get,
      :show => :get
  }

  map.resource :organization, :only => :show, :member => {
    :news => :get,
    :notice => :get,
    :notice_filter => :post,
    :messages => :get,
    :management => :get, 
    :manager => :get, 
    :codes => :get, 
    :controldebt => :get,
    :starbox => :post,
    :notice_subscribe => :get,
    :notice_unsubscribe => :get,

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
  },
  :path_names => {
    :notice_unsubscribe => 'notice-unsubscribe',
    :notice_subscribe => 'notice-subscribe'
  }
  
  
  map.resources :markets
  map.markets '/market/:id', :controller => 'markets', :action => 'index', :id => 1

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
  map.senddocumentsrk '/senddocuments/form/type_id/14', :controller => :senddocuments, :action => :form, :type_id => 14

  map.resources :authorities, :collection => {
      :withdraw_create => :get
  }

  map.resources :withdraws, :collection => {
      :withdraw_create => :get
  }

  map.view_notice 'organization/notice/:id/type/1', :controller => 'notice', :action => 'show_message'
  map.view_notice 'organization/notice/:id/type/2', :controller => 'notice', :action => 'show_notice'
  map.view_notice 'organization/notice/:id/type/3', :controller => 'notice', :action => 'show_debt'
  map.subscription 'organization/subscription', :controller => 'subscription', :action => 'index', :path_names => :subscription_path
  
  #map.insider     "/insider", :controller => :insiders, :action => :new,    :conditions => { :method => :get }
  #map.rat_insider "/insider", :controller => :insiders, :action => :create, :conditions => { :method => :post }
end