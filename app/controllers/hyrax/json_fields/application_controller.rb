# frozen_string_literal: true
module Hyrax
  module JsonFields
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
