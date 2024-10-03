require "openai"
require "logger"
module Inspec
  class OpenAIClient
    def initialize
      configure
      # Initialize the OpenAI client with logging
      @client = OpenAI::Client.new(
        log_errors: true # The version of the API
      )
    end

    # Method to get a chat completion response
    def get_chat_completion(messages, model: 'gpt-4o', max_tokens: 100)
      response = @client.chat(
        parameters: {
          model:,
          messages:,
          max_tokens:
        }
      )
      response['choices'].first['message']['content'].strip
    rescue StandardError => e
      puts "Error: #{e.message}"
    end

    private

    def configure
      OpenAI.configure do |config|
        config.access_token = ENV['OPENAI_API_KEY']
        config.uri_base = ENV['OPENAI_BASE_URL']
        config.api_type = :azure
        config.api_version = '2023-05-15' # use only this version
      end
    end
  end
end
