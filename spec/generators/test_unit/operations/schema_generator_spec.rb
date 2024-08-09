# frozen_string_literal: true

module TestUnit
  module Generators
    module Operations
      RSpec.describe SchemaGenerator, type: :generator do
        setup_default_destination

        tests described_class

        let(:schema_test_path)      { "test/operations/users/create/schema_test.rb" }
        let(:base_schema_test_path) { "test/operations/users/base/schema_test.rb" }

        subject(:schema_generator) do
          run_generator(
            %w[
              user
              create
            ]
          )
        end

        it "copy templates" do
          schema_generator

          expect(File).to exist("#{destination_root}/#{schema_test_path}")
          expect(File).to exist("#{destination_root}/#{base_schema_test_path}")
        end

        it "uses the expected template files" do
          schema_generator

          expect(content_for(schema_test_path)).to match(/class SchemaTest < ActiveSupport::TestCase/)
          expect(content_for(base_schema_test_path)).to match(/module Base/)
        end

        context "with component option" do
          let(:schema_test_path)      { "test/components/identity/users/operations/users/create/schema_test.rb" }
          let(:base_schema_test_path) { "test/components/identity/users/operations/users/base/schema_test.rb" }

          subject(:schema_generator) do
            run_generator(
              %w[
                user
                create
                --component identity/users
              ]
            )
          end

          it "copy templates" do
            schema_generator

            expect(File).to exist("#{destination_root}/#{schema_test_path}")
            expect(File).to exist("#{destination_root}/#{base_schema_test_path}")
          end
        end
      end
    end
  end
end
