# encoding: utf-8

module Train::Transports
  module Helpers
    module Azure
      class SubscriptionNumberFileParser
        def initialize(index, credentials)
          @index       = index
          @credentials = credentials

          validate!
        end

        def validate!
          if @index == 0
            raise "Index must be greater than 0."
          end

          if @index > @credentials.sections.length
            raise "Your credentials file only contains #{@credentials.sections.length} subscriptions. You specified number #{@index}."
          end
        end

        def subscription_id
          @subscription_id ||= @credentials.sections[@index - 1]
        end
      end
    end
  end
end
