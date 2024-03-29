require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Casting
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.to_prepare do
        Devise::SessionsController.layout "login_layout"
        Devise::RegistrationsController.layout "login_layout"
        Devise::ConfirmationsController.layout "login_layout"
        Devise::UnlocksController.layout "login_layout"
        Devise::PasswordsController.layout "login_layout"
    end
    # Don't generate system test files.
    config.generators.system_tests = nil
    config.i18n.default_locale = :fr
    I18n.available_locales = [:fr, :ar]
    config.active_job.queue_adapter = :sidekiq
  end
end
