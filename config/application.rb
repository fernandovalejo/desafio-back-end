require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module DesafioBackEnd
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'La Paz'
    config.generators do |g|
      g.assets false
      g.helper false
      g.javascripts false
      g.stylesheets false
    end
  end
end

