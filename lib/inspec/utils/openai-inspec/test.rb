require_relative 'client'  # Adjust the path if needed

# Example usage
client = OpenAIClient.new

prompt = "Once upon a time in a land far away,"
completion = client.get_completion(prompt)
puts "Completion: #{completion}"

messages = [{ role: 'user', content: "Tell me a story about a dragon." }]
chat_completion = client.get_chat_completion(messages)
puts "Chat Completion: #{chat_completion}"
