require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Paperclip.options[:command_path] = "/opt/ImageMagick/bin" if Rails.env.development?

OneSignal::OneSignal.user_auth_key = "ODMyNDM2ZDQtNjc2MS00YzQwLWE0NWEtZGU5Yjk3MGVmNjJj"
OneSignal::OneSignal.api_key = "ZmQ2NDA5NDktNTVmMC00NmUwLWJlN2QtZTg5MGY3MWMyOThh"

module Pickapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :it
    config.time_zone = 'Rome'

    config.assets.paths << Rails.root.join("vendor","assets","bower_components")

    config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff)$)
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # cors

    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*',
    #       :headers => :any,
    #       :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'X-CSRF-Token'],
    #       :methods => [:get, :post, :options, :delete, :put]
    #   end
    # end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose: %i(access-token expiry token-type uid client X-CSRF-Token),
          methods: %i(get post put patch delete options head)
      end
    end

  end
end
