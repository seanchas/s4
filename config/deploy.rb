$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"
require 'bundler/capistrano'

set :application, "cabinet"
set :repository,  "http://github.com/seanchas/s4.git"
set :user,        :ror
set :runner,      :ror
set :use_sudo,    false

set :deploy_to,   "/export/depo/ror/linux/appservers/#{application}"
set :deploy_via,  :copy

set :scm, :git

set :rvm_ruby_string, "1.9.2@s4"
set :rvm_type,        :user


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

configuration = [
  'config/database.yml',
  'config/environments/production.rb',
  'config/initializers/s4.rb',
  'config/initializers/reports.rb',
  'config/initializers/passport.rb',
  'config/initializers/cookie_verification_secret.rb',
  'config/initializers/mailer.rb',
  'config/initializers/recaptcha.rb',
  'config/locales/ru.yml',
  'config/locales/en.yml',
  'public/uploads',
  'vendor/rails'
]

namespace :deploy do

  task :update_configuration, :roles => :app do
    configuration.each do |entry|
      run <<-CMD
        if [ -f #{release_path}/#{entry} ]; then rm -f #{release_path}/#{entry}; fi; ln -s #{shared_path}/rails/#{entry} #{release_path}/#{entry}
      CMD
    end
  end
  
end

after "deploy:update_code", "deploy:update_configuration"
