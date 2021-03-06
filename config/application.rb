require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EnergyhubPlatform
  class Application < Rails::Application
    config.from_file = 'settings.yml'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Central Time (US & Canada)'

    config.autoload_paths += %W(
     #{config.root}/lib
    )

    config.generators do |g|
      g.factory_girl true
      g.helper false
      g.javascripts false
      g.stylesheets false
      g.template_engine :slim
      g.test_framework :rspec, fixture: false
    end
  end
end
