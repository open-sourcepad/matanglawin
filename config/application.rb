require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'multi_json'

Bundler.require(*Rails.groups)

module Finder
  class Application < Rails::Application
    MultiJson.engine = :Oj

    config.middleware.delete "ActionDispatch::Cookies"
    config.middleware.delete "ActionDispatch::Session::CookieStore"
    config.middleware.delete "ActionDispatch::Flash"
    config.serve_static_files = true
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'controllers', '{**}')]

    config.active_record.raise_in_transactional_callbacks = true
    config.angular_templates.inside_paths   = ['client/src']
    config.session_store :disabled
    config.action_mailer.preview_path = "#{Rails.root}/app/mailers/preview"
    config.active_job.queue_adapter = :sidekiq
    config.autoload_paths << Rails.root.join('app/services/**')
    config.generators do |g|
      g.template_engine nil
      g.test_framework  nil
      g.assets  false
      g.helper false
      g.stylesheets false
    end
  end
end
