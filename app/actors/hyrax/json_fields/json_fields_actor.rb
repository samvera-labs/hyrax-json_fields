# frozen_string_literal: true
module Hyrax
  module JsonFields
    class JsonFieldsActor < Hyrax::Actors::AbstractActor
      def create(env)
        jsonify_fields(env) && next_actor.create(env)
      end

      def update(env)
        jsonify_fields(env) && next_actor.update(env)
      end

      private

        def jsonify_fields(env)
          env.curation_concern.class.json_fields.each do |field, field_config|
            if recursive_blank?(without_ignored_keys(env.attributes[field], field_config))
              env.attributes.delete(field)
            else
              env.attributes[field].reject! { |o| recursive_blank?(without_ignored_keys(o, field_config) } if env.attributes[field].is_a? Array
              env.attributes[field] = env.attributes[field].to_json
            end

            ensure_multiple!(env, field)
          end
        end

        def without_ignored_keys(obj, field_config)
          obj.reject { |k, _v| ignorable_keys(field_config).include?(k) }
        end

        def ignorable_keys(field_config)
          Array(field_config[:subfields]&.select { |_field, subfield| subfield[:ignorable] }&.keys)
        end

        def recursive_blank?(obj)
          case obj
          when Hash
            obj.values.all? { |o| recursive_blank?(o) }
          when Array
            obj.all? { |o| recursive_blank?(o) }
          else
            obj.blank?
          end
        end

        def ensure_multiple!(env, field)
          env.attributes[field] = Array(env.attributes[field]) if env.curation_concern.class.multiple?(field)
        end
    end
  end
end

