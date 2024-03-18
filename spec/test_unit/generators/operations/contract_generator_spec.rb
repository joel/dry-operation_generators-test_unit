# frozen_string_literal: true

module TestUnit
  module Generators
    module Operations
      RSpec.describe ContractGenerator, type: :generator do
        setup_default_destination

        tests described_class

        let(:contract_test_path) { "test/operations/users/create/contract_test.rb" }

        subject(:contract_generator) do
          run_generator(
            %w[
              user
              create
            ]
          )
        end

        it "copy templates" do
          contract_generator

          expect(File).to exist("#{destination_root}/#{contract_test_path}")
        end

        it "uses the expected template files" do
          contract_generator

          expect(content_for(contract_test_path)).to match(/Test based on the following contract rules/)
        end

        context "with component option" do
          let(:contract_test_path) { "test/components/identity/users/operations/users/create/contract_test.rb" }

          subject(:contract_generator) do
            run_generator(
              %w[
                user
                create
                --component identity/users
              ]
            )
          end

          it "copy templates" do
            contract_generator

            expect(File).to exist("#{destination_root}/#{contract_test_path}")
          end
        end
      end
    end
  end
end
