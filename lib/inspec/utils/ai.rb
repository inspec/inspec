require "openai"
require "inspec/utils/openai-inspec/client"

# Integration goes here
module Inspec
  class AI
    def self.start
      # Feel free to change this
      client = Inspec::OpenAIClient.new
      puts client.get_chat_completion([{ role: 'user', content: 'Hello!' }])
    end
  end
end
