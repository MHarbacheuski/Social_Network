# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RailsSocialNetwork
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
    config.i18n.default_locale = :en
    config.paths['app/views'] << 'app/views/devise'

    config.generators do |g|
      g.test_framework :rspec
      g.helper_specs false
      g.controller_specs false
      g.view_specs false
      g.routing_specs false
      g.request_specs false
    end
  end
end
