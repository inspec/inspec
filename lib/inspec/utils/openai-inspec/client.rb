require 'openai'

class OpenAIClient
  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
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
