module Mixlib
  class ShellOut
    class Error < RuntimeError; end
    class ShellCommandFailed < Error; end
    class CommandTimeout < Error; end
    class InvalidCommandOption < Error; end
    class EmptyWindowsCommand < ShellCommandFailed; end
  end
end
