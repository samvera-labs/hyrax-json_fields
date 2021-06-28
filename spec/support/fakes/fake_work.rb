# frozen_string_literal: true

class FakeWork < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  include ::Hyrax::JsonFields::ModelBehavior

  validates :title, presence: { message: 'Your work must have a title.' }

  self.indexer = WorkIndexer
  self.human_readable_type = 'Work'
  self.json_attributes = {
    creator: {
      subfields: {
        name_type: {
          required: true,
          multiple: false,
          ignorable: true
        },
        name: {
          required: true,
          multiple: true
        }
      }
    }
  }
end
