# frozen_string_literal: true
module Hyrax
  module JsonFields
    class Engine < ::Rails::Engine
      isolate_namespace Hyrax::JsonFields

      config.generators do |g|
        g.test_framework :rspec
      end
    end
  end
end
