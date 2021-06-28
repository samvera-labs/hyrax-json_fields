# frozen_string_literal: true

require "rails/all"
require "hyrax"
require_relative "json_fields/version"
require_relative "../../app/forms/concerns/hyrax/json_fields/work_form"
require_relative "../../app/models/concerns/hyrax/json_fields/model_behavior"

module Hyrax
  module JsonFields
    class Error < StandardError; end
    # Your code goes here...
  end
end
