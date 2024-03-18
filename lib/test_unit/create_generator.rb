#!/usr/bin/env ruby
# frozen_string_literal: true

begin
  require "thor/group"
rescue LoadError
  puts "Thor is not available.\nIf you ran this command from a git checkout " \
       "of Rails, please make sure thor is installed,\nand run this command " \
       "as `ruby #{$PROGRAM_NAME} #{(ARGV | ["--dev"]).join(" ")}`"
  exit
end

require "active_support/inflector"

module TestUnit
  class CreateGenerator < Thor::Group
    include Thor::Actions

    class << self
      def exit_on_failure?
        true
      end
    end

    desc "Create a new Generator (Generator of generators)"

    source_root File.expand_path(".", __dir__)

    class_option :force, type: :boolean, default: false

    argument :name, type: :string, required: true, desc: "Name of the generator"
    argument :library, type: :string, required: true, desc: "Name of the library, i.e. Dry::Schema"
    class_option :dry_run, type: :boolean, default: true

    def plural_name
      name.pluralize
    end

    def singular_name
      name.singularize
    end

    def class_name
      singular_name.capitalize
    end

    def copy_generator_files
      return if options[:dry_run]

      say "Adding files...", :green

      template "templates/template_generator.rb.erb", "lib/test_unit/generators/operations/#{name}_generator.rb"
      template "templates/template_generator_spec.rb.erb",
               "spec/test_unit/generators/operations/#{name}_generator_spec.rb"

      create_file "lib/test_unit/generators/operations/#{name}/templates/#{name}_test.rb.erb" do
        "This is #{name}.rb.erb"
      end
    end

    def update_setup
      say "Updating setup...", :green

      setup_file   = "lib/test_unit/generators/operations/setup/templates/generators.rb"
      include_text = " \"test_unit/generators/operations/#{name}_generator\" if defined?(#{library})\nrequire"

      insert_into_file setup_file, include_text.to_s, after: Regexp.new(Regexp.escape("require"))
    end
  end
end

# ./bin/generator <generator name> --no-dry_run
TestUnit::CreateGenerator.start(ARGV)
