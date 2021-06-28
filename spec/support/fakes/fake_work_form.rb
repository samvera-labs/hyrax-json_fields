# frozen_string_literal: true
module Hyrax
  class FakeWorkForm < Hyrax::Forms::WorkForm
    include Hyrax::FormTerms
    self.model_class = ::FakeWork
    include HydraEditor::Form::Permissions
    include Hyrax::JsonFields::WorkForm
    self.terms += %i[resource_type]
  end
end

