# frozen_string_literal: true

require "operations/base/generators/base_generator"

module TestUnit
  module Generators
    module Operations
      class SchemaGenerator < Rails::Generators::NamedBase
        include ::Operations::Base::Generators::BaseGenerator

        source_root File.expand_path("schema/templates", __dir__)

        desc "Creates a schema test file for the operation"

        def generate_files
          super

          template "schema_test.rb.erb", "#{root_test_file_path}/operations/#{plural_name}/#{verb}/schema_test.rb"
          template "base/schema_test.rb.erb", "#{root_test_file_path}/operations/#{plural_name}/base/schema_test.rb"
        end
      end
    end
  end
end
