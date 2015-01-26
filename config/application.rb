require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Parkshop
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec
      g.template_engine :haml
    end

    config.active_record.raise_in_transactional_callbacks = true

  end
end
