# frozen_string_literal: true

require_relative "lib/hyrax/json_fields/version"

Gem::Specification.new do |spec|
  spec.name          = "hyrax-json_fields"
  spec.version       = Hyrax::JsonFields::VERSION
  spec.authors       = ["Chris Colvard", "Paul Danelli"]
  spec.email         = ["chris.colvard@gmail.com", "prdanelli@gmail.com"]

  spec.summary       = "JSONify field contents of Hyrax models"
  spec.description   = "Allow use of more complex nested fields within Hyrax work type forms."
  spec.homepage      = ""
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'hyrax', '~> 2.8'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
