# encoding: utf-8

module Train::Transports
  module Helpers
    module Azure
      class FileParser
        def initialize(credentials)
          @credentials = credentials

          validate!
        end

        def validate!
          return if @credentials.sections.count == 1

          raise "Credentials file must have one entry. Check your credentials file. If you have more than one entry set AZURE_SUBSCRIPTION_ID environment variable."
        end

        def subscription_id
          @subscription_id ||= @credentials.sections[0]
        end
      end
    end
  end
end
