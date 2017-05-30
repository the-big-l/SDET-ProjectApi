require_relative 'boot'
require_relative '../app/middleware/catch_json_parse_errors'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SDETProjectapi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :rspec,
      :fixtures => false,
      :view_specs => false,
      :helper_specs => false,
      :routing_specs => false,
      :controller_specs => true,
      :request_specs => false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    # If a client submits invalid / poorly formatted JSON to a Rails app,
    # a cryptic and unhelpful error is thrown. The middleware that parses
    # parameters (ActionDispatch::ParamsParser) runs long before the
    # controller is on the scene, and throws exceptions when invalid JSON
    # is encountered. You can’t capture the parsing exception in the
    # controller, as the controller is never involved in serving the
    # failed request.
    # config.autoload_paths += Dir["#{config.root}/../app/middleware/**/"]
    config.middleware.use CatchJsonParseErrors
  end
end
