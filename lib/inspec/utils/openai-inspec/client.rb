require "openai"
require "logger"
module Inspec
  class OpenAIClient
    def initialize
      access_token = ENV['OPENAI_API_KEY']
      base_url = ENV['OPENAI_BASE_URL']

      # Initialize the OpenAI client with logging
      @client = OpenAI::Client.new(
        access_token: access_token,
        base_url: base_url,
        api_version: '2024-03-01-preview',  # The version of the API
        # connection_options: {
        #   faraday_options: {
        #     request: { timeout: 120 },  # Set any additional request options here
        #     response: { logger: Logger.new(STDOUT), log_level: :info }  # Enable logging with debug level
        #   }
        # }
      )
    end


    def get_models
      @client.models
    end

    # Method to get a completion response
    def get_completion(prompt, model: "gpt-4-turbo", max_tokens: 100)
      response = @client.completions(
        parameters: {
          model: model,
          prompt: prompt,
          max_tokens: max_tokens
        }
      )
      response['choices'].first['text'].strip
    rescue StandardError => e
      puts "Error: #{e.message}"
    end

    # Method to get a chat completion response
    def get_chat_completion(messages, model: "gpt-4-turbo", max_tokens: 100)
      response = @client.chat(
        parameters: {
          model: model,
          messages: messages,
          max_tokens: max_tokens
        }
      )
      response['choices'].first['message']['content'].strip
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end
end

