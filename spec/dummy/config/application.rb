require "rails"
require "action_controller/railtie"
require "action_view/railtie"
require "propshaft"
require "floatpunk_ui"

module Dummy
  class Application < Rails::Application
    config.load_defaults 8.1
    config.root = File.expand_path("..", __dir__)
    config.eager_load = false
    config.secret_key_base = "dummy"
    config.hosts.clear
  end
end
