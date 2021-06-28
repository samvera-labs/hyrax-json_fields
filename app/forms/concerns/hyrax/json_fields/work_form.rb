# frozen_string_literal: true
module Hyrax
  module JsonFields
    module WorkForm
      extend ActiveSupport::Concern

      included do
        def self.build_permitted_params
          super.tap do |permitted_params|
            model_class.json_fields.each do |field, field_config|
              permitted_params << { field => field_config['subfields'].keys.map { |subfield| field_config['subfields'][subfield]['form']['multiple'] ? { subfield.to_sym => [] } : subfield.to_sym } }
            end
          end
        end

        # TODO: override field methods with JSON.parse(field).first equivalent
        model_class.json_fields.each do |field, _field_config|
          alias_method :"_#{field}", :"#{field}"
          define_method field do |*_args|
            return [{}] unless respond_to?(:"_#{field}") && send(:"_#{field}")&.first.present?
            JSON.parse(send(:"_#{field}")).first
          end
        end
      end
    end
  end
end
