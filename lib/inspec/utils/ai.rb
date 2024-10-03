require "openai"

# Integration goes here
module Inspec
  class AI
    def self.start
      client = Inspec::OpenAIClient.new
      response = client.get_chat_completion([{ role: 'user', content: 'Hello!' }])
      puts response
    rescue StandardError => e
      puts "Failed to get response from OpenAI: #{e.message}"
    end
  end

  private

  class OpenAIClient
    DEFAULT_MODEL = 'gpt-4'.freeze
    DEFAULT_MAX_TOKENS = 100

    def initialize
      configure_openai_client
      @client = OpenAI::Client.new(log_errors: true)
    end

    # Method to get a chat completion response
    def get_chat_completion(messages, model: DEFAULT_MODEL, max_tokens: DEFAULT_MAX_TOKENS)
      response = @client.chat(
        parameters: {
          model: model,
          messages: messages,
          max_tokens: max_tokens
        }
      )
      response.dig('choices', 0, 'message', 'content')&.strip
    rescue StandardError => e
      raise "Error fetching chat completion: #{e.message}"
    end

    private

    def configure_openai_client
      OpenAI.configure do |config|
        config.access_token = ENV.fetch('OPENAI_API_KEY')
        config.uri_base = ENV.fetch('OPENAI_BASE_URL')
        config.api_type = :azure
        config.api_version = '2023-05-15'
      end
    end
  end
end