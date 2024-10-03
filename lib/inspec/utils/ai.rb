require "openai"

module Inspec
  class AI
    PROMPT_TEMPLATE_CHAT = " For this requested question, Pretend as a professional Compliance and Chef Inspec Expert and respond only with Chef Inspec and Compliance related answers. Make sure the question is related to Chef Inspec or Compliance and politely refuse to respond when it is an unrelated question.".freeze
    PROMPT_TEMPLATE_SUMMARY = " For this requested question, Pretend as a professional Compliance and Chef Inspec Expert and analyse this InSpec profile control result.".freeze

    def self.start
      client = OpenAIClient.new
      puts "InspecAI - type 'exit' to end the conversation"
      conversation_history = []

      loop do
        print 'You: '
        user_input = $stdin.gets.chomp

        # Exit on 'exit' command
        break if user_input.downcase == 'exit'

        conversation_history << { role: 'user', content: "#{user_input}#{PROMPT_TEMPLATE_CHAT}" }
        response = client.get_chat_completion(conversation_history)

        conversation_history << { role: 'assistant', content: response }
        puts "\nInspecAI: #{response}\n"
      end
    rescue StandardError => e
      puts "Failed to get response from OpenAI: #{e.message}"
    end

    def self.summarise_control
      client = OpenAIClient.new
      latest_file_path = get_latest_file_path('inspec-ai-control-logs')
      control_results = File.read(latest_file_path)

      conversation_history = [
        { role: 'user', content: "#{control_results}#{PROMPT_TEMPLATE_SUMMARY}" }
      ]
      response = client.get_chat_completion(conversation_history)

      puts "\nInspecAI: #{response}\n"
    rescue StandardError => e
      puts "Failed to summarize control: #{e.message}"
    end

    private

    def self.get_latest_file_path(directory)
      latest_file = Dir.entries(directory)
                       .select { |file| File.file?(File.join(directory, file)) }
                       .max_by { |file| File.ctime(File.join(directory, file)) }
      File.join(directory, latest_file)
    end
  end

  class OpenAIClient
    DEFAULT_MODEL = 'gpt-4'.freeze
    DEFAULT_MAX_TOKENS = 100

    def initialize
      configure_openai_client
      @client = OpenAI::Client.new(log_errors: true)
    end

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
