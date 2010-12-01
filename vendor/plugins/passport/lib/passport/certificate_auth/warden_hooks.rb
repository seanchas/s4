Warden::Manager::after_authentication do |record, warden, options|
  unless warden.certificate?
    warden.response.set_cookie(warden.certificate_settings.name, {
      :value  => warden.generate_certificate(record.id).id,
      :domain => warden.certificate_settings.domain,
      :path   => "/"
    })
  end
end

Warden::Manager.before_logout do |record, warden, options|
  warden.response.delete_cookie(warden.certificate_settings.name, {
    :domain => warden.certificate_settings.domain,
    :path   => "/"
  })
end
