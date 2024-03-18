# frozen_string_literal: true

module TestUnit
  module Generators
    module Operations
      class SetupGenerator < ::Rails::Generators::Base
        def copy_initializer_file
          initializer "operation_generators-test_unit.rb",
                      File.read(File.expand_path("setup/templates/generators.rb.tt", __dir__))
        end
      end
    end
  end
end
