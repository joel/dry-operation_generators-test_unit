# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    allow(Rails).to receive_message_chain(:application, :config, :generators, :test_framework).and_return(:test_unit)
  end
end
