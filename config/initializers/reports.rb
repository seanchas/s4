Reports.configure do |config|
  if(!APP_CONFIG['reports_url'].nil?)
    config.site = APP_CONFIG['reports_url']
  end
end