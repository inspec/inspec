require "openai"
require "inspec/utils/openai-inspec/client"

# Integration goes here
module Inspec
  class AI
    def self.start
      # Feel free to change this
      client = Inspec::OpenAIClient.new

      puts client.get_models

      # prompt = "Once upon a time in a land far away,"
      # completion = client.get_completion(prompt)
      # puts "Completion: #{completion}"


      # messages = [{ role: 'user', content: "Tell me a story about a dragon." }]
      # chat_completion = client.get_chat_completion(messages)
      # puts "Chat Completion: #{chat_completion}"
    end
  end
end
