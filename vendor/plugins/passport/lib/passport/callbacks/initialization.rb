Warden::Manager.on_request do |warden|
  Passport::Utils::Reference.clear! unless Rails.configuration.cache_classes
end

Warden::Manager.before_failure do |env, options|
  env['warden'].request.params['action'] = 'unauthenticated'
end

Warden::Manager.before_failure do |env, options|
  if request = env['action_controller.rescue.request']
    request.params['action'] = 'unauthenticated'
  end
end
