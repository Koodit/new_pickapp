require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Paperclip.options[:command_path] = "/opt/ImageMagick/bin" if Rails.env.development?

module Pickapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :it

    config.assets.paths << Rails.root.join("vendor","assets","bower_components")

    config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff)$)
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

  end
end
