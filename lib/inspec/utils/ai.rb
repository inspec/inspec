require "openai"

module Inspec
  class AI
    PROMPT_TEMPLATE_CHAT = "Pretend as a professional Compliance and Chef Inspec Expert. Respond only to Chef Inspec and Compliance related queries. Politely refuse to respond when it is an unrelated question.".freeze
    PROMPT_TEMPLATE_SUMMARY = " For this requested question, Pretend as a professional Compliance and Chef Inspec Expert and analyse this InSpec profile control result.".freeze
    PROMPT_TEMPLATE_REMEDIATE = " For this requested question, Pretend as a professional Compliance and Chef Inspec Expert provide remeditation strategies based on InSpec profile control result.".freeze

    class << self
      def start
        client = OpenAIClient.new
        puts "InspecAI - type 'exit' to end the conversation"
        # sets the prompt to system
        conversation_history = [set_prompt_context_for(PROMPT_TEMPLATE_CHAT)]

        loop do
          print "You: "
          user_input = $stdin.gets.chomp
          break if user_input.downcase.strip == "exit"

          conversation_history << collect_user_input(user_input)
          response = client.get_chat_completion(conversation_history)

          conversation_history << capture_ai_response(response)
          puts "\nInspecAI: #{response}\n"
        end
      rescue StandardError => e
        puts "Failed to get response from OpenAI: #{e.message}"
      end

      def summarise_control
        handle_control_task("summarize", PROMPT_TEMPLATE_SUMMARY)
      end

      def remediation_suggestions
        handle_control_task("remediate", PROMPT_TEMPLATE_REMEDIATE)
      end

      def handle_control_task(task_type, prompt_template)
        client = OpenAIClient.new
        latest_file_path = get_latest_file_path("inspec-ai-control-logs")
        control_results = File.read(latest_file_path)

        conversation_history = [{ role: "user", content: "#{control_results} #{prompt_template}" }]
        response = client.get_chat_completion(conversation_history)

        puts "\nInspecAI (#{task_type}): #{response}\n"
      rescue StandardError => e
        puts "Failed to #{task_type} control: #{e.message}"
      end

      def get_latest_file_path(directory)
        latest_file = Dir.entries(directory)
          .select { |file| File.file?(File.join(directory, file)) }
          .max_by { |file| File.ctime(File.join(directory, file)) }
        File.join(directory, latest_file)
      end

      private

      def capture_ai_response(response)
        { role: "assistant", content: response }
      end

      def collect_user_input(user_input)
        { role: "user", content: user_input }
      end

      def set_prompt_context_for(prompt_template)
        { role: "system", content: prompt_template }
      end
    end
  end

  class OpenAIClient
    DEFAULT_MODEL = "gpt-4".freeze
    API_VERSION = "2023-05-15".freeze

    def initialize
      configure_openai_client
      @client = OpenAI::Client.new(log_errors: true)
    end

    def get_chat_completion(messages, model: DEFAULT_MODEL)
      response = @client.chat(
        parameters: {
          model: model,
          messages: messages,
        }
      )
      if response["choices"] && response["choices"].any?
        response["choices"].map { |choice| choice["message"]["content"].strip }.join("\n")
      else
        raise StandardError, "Error: Incomplete response or empty response from OpenAI"
      end
    rescue StandardError => e
      raise "Error fetching chat completion: #{e.message}"
    end

    private

    def configure_openai_client
      OpenAI.configure do |config|
        config.access_token = ENV.fetch("OPENAI_API_KEY")
        config.uri_base = ENV.fetch("OPENAI_BASE_URL")
        config.api_type = :azure
        config.api_version = API_VERSION
      end
    end
  end
end
