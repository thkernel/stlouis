require_relative 'boot'

require 'rails/all'
require 'apartment/elevators/subdomain' # or 'domain', 'first_subdomain', 'host'

require './lib/shared_utils/utils'
require './lib/cart/cart'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stlouis
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}').to_s]

    config.i18n.default_locale = :fr

    config.assets.paths << Rails.root.join("app", "assets", "fonts")


    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)


    # Grape API requirement.
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    # Rack-Cors
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end
