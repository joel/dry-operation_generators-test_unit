# frozen_string_literal: true

module TestUnit
  module Generators
    module Operations
      RSpec.describe OperationGenerator, type: :generator do
        setup_default_destination

        tests described_class

        let(:operation_test_path) { "test/operations/users/create/operation_test.rb" }

        subject(:operation_generator) do
          run_generator(
            %w[
              user
              create
            ]
          )
        end

        it "copy templates" do
          operation_generator

          expect(File).to exist("#{destination_root}/#{operation_test_path}")
        end

        it "uses the expected template files" do
          operation_generator

          expect(content_for(operation_test_path)).to match(/Test based on the following operations/)
        end

        context "with component option" do
          let(:operation_test_path) { "test/components/identity/users/operations/users/create/operation_test.rb" }

          subject(:operation_generator) do
            run_generator(
              %w[
                user
                create
                --component identity/users
              ]
            )
          end

          it "copy templates" do
            operation_generator

            expect(File).to exist("#{destination_root}/#{operation_test_path}")
          end
        end
      end
    end
  end
end
