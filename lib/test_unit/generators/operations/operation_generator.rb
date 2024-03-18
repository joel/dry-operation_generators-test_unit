# frozen_string_literal: true

module TestUnit
  module Generators
    module Operations
      class OperationGenerator < Rails::Generators::NamedBase
        include ::Operations::Base::Generators::BaseGenerator

        source_root File.expand_path("operation/templates", __dir__)

        def generate_files
          super

          template "operation_test.rb.erb", "#{root_test_file_path}/operations/#{plural_name}/#{verb}/operation_test.rb"
        end
      end
    end
  end
end
