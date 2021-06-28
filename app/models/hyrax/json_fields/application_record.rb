# frozen_string_literal: true
module Hyrax
  module JsonFields
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
