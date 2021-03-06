require "devise"
require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"
require 'rack/cors'

Bundler.require(*Rails.groups)

module Jwt
  class Application < Rails::Application
    config.load_defaults 6.0
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://your.frontend.domain.com'
        resource '/api/*',
                 headers: %w(Authorization),
                 methods: :any,
                 expose: %w(Authorization),
                 max_age: 600
      end
    end
    config.api_only = true
  end
end
