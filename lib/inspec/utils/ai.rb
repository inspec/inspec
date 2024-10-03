require "openai"

# Integration goes here
module Inspec
  class AI
    def self.start
      client = Inspec::OpenAIClient.new
      # TODO: Add some user docs
      puts "InspecAI  - type 'exit' to end the conversation"
      conversation_history = []
      prompt_template_chat = ' For this requested question, Pretend as a professional Compliance and Chef Inspec Expert and respond only with Chef Inspec and Complaince related answers. Make sure if the question is only related to Chef Inspec or Compliance and refuse politely to respond when it is an unrelated question'

      loop do
        print 'You: '
        user_input = $stdin.gets.chomp

        # simple way to exit
        # TODO: catch CTL+C
        exit if user_input.downcase == 'exit'

        # TODO: Find a way to send prompts
        conversation_history << { role: 'user', content: user_input + prompt_template_chat }
        response = client.get_chat_completion(conversation_history)

        conversation_history << { role: 'assistant', content: response }

        puts "\n"
        puts "InspecAI: #{response}"
      end
    rescue StandardError => e
      puts "Failed to get response from OpenAI: #{e.message}"
    end
  end

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
          model:,
          messages:,
          max_tokens:
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
