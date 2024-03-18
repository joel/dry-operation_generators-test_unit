# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require "rails/generators"

require "test_unit/generators/operations/setup_generator"

require "operations/base"

module TestUnit
  class Error < StandardError; end
end
