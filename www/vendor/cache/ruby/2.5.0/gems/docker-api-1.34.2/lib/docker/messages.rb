# This class represents all the messages either received by chunks from attach
class Docker::Messages

  attr_accessor :buffer, :stdout_messages, :stderr_messages, :all_messages

  def initialize(stdout_messages=[],
                 stderr_messages=[],
                 all_messages=[],
                 buffer="")
    @stdout_messages = stdout_messages
    @stderr_messages = stderr_messages
    @all_messages = all_messages
    @buffer = buffer
  end

  def add_message(source, message)
    case source
    when 1
      stdout_messages << message
    when 2
      stderr_messages << message
    end
    all_messages << message
  end

  def get_message(raw_text)
    header = raw_text.slice!(0,8)
    if header.length < 8
      @buffer = header
      return
    end
    type, length = header.unpack("CxxxN")

    message = raw_text.slice!(0,length)
    if message.length < length
      @buffer = header + message
    else
      add_message(type, message)
    end
  end

  def append(messages)
    @stdout_messages += messages.stdout_messages
    @stderr_messages += messages.stderr_messages
    @all_messages += messages.all_messages
    messages.clear

    @all_messages
  end

  def clear
    stdout_messages.clear
    stderr_messages.clear
    all_messages.clear
  end

  # Method to break apart application/vnd.docker.raw-stream headers
  def decipher_messages(body)
    raw_text = buffer + body.dup
    messages = Docker::Messages.new
    while !raw_text.empty?
      messages.get_message(raw_text)
    end

    messages
  end
end
