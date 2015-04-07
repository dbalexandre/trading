module Feature
  module Matchers
    extend RSpec::Matchers::DSL
    include Capybara::DSL

    matcher :have_alert do |alert|
      match do |page|
        expect(page).to have_css(".flash-alert", text: alert)
      end

      failure_message do |page|
        "expected #{page.text.inspect} to have alert #{alert.inspect}"
      end

      failure_message_when_negated do |page|
        "expected #{page.text.inspect} to not have alert #{alert.inspect}"
      end
    end

    matcher :have_notice do |notice|
      match do |page|
        expect(page).to have_css(".flash-notice", text: notice)
      end

      failure_message do |page|
        "expected #{page.text.inspect} to have notice #{notice.inspect}"
      end

      failure_message_when_negated do |page|
        "expected #{page.text.inspect} to not have notice #{notice.inspect}"
      end
    end
  end
end

RSpec.configure do |config|
  config.include Feature::Matchers, type: :feature
end
