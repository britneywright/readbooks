require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Readbooks
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'admin_variables.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    config.generators do |g|
        g.test_framework :rspec,
            fixtures: true,
            view_specs: false,
            helper_specs: false,
            routing_specs: false,
            controller_specs: true,
            request_specs: false
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  
  config.action_mailer.delivery_method   = :postmark
  config.action_mailer.postmark_settings = { :api_key => ENV['POSTMARK_API_KEY'] }
  end
end
