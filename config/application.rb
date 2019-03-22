require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Asker
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ru

    config.generators do |generator|
      generator.test_framework  false
      generator.stylesheets     false
      generator.javascripts     false
      generator.helper          false
      generator.channel         assets: false
    end
  end
end
