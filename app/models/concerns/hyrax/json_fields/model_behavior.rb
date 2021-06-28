# frozen_string_literal: true
module Hyrax
  module JsonFields
    module ModelBehavior
      extend ActiveSupport::Concern

      included do
        class_attribute :json_fields
        self.json_fields = []
      end
    end
  end
end
