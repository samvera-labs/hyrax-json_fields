# frozen_string_literal: true

require 'support/fakes/fake_work'
require 'support/fakes/fake_work_form'

RSpec.describe Hyrax::JsonFields::WorkForm do
  describe ".build_permitted_params" do
    it "permits subfields of json fields" do
      expect(Hyrax::FakeWorkForm.build_permitted_params).to hash_include(creator: [ :name_type, name: [] ])
    end
  end
end

