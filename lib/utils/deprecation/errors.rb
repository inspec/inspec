require 'inspec/errors'

module Inspec
  module Deprecation
    class Error < Inspec::Error; end

    class NoSuchGroupError < Error; end

    class InvalidConfigFileError < Error; end
    class MalformedConfigFileError < InvalidConfigFileError; end
    class UnrecognizedActionError < InvalidConfigFileError; end
    class UnrecognizedOutputStreamError < InvalidConfigFileError; end
  end
end