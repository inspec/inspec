require 'inspec/errors'

module Inspec
  module Deprecation
    class Error < Inspec::Error; end

    class MalformedConfigFileError < Error; end
    class NoSuchGroupError < Error; end
    class UnknownActionError < Error; end
  end
end