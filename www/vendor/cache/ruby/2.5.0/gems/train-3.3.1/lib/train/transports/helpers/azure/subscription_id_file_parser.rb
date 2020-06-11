# encoding: utf-8

module Train::Transports
  module Helpers
    module Azure
      class SubscriptionIdFileParser
        attr_reader :subscription_id

        def initialize(subscription_id, credentials)
          @subscription_id = subscription_id
          @credentials     = credentials

          validate!
        end

        def validate!
          if @credentials.sections.empty? || @credentials[subscription_id].empty?
            raise "No credentials found for subscription number #{subscription_id}"
          end
        end
      end
    end
  end
end
