# copyright: 2017, Chef Software Inc.

module Inspec
  module Exceptions
    class InputsFileDoesNotExist < ArgumentError; end
    class InputsFileNotReadable < ArgumentError; end
    class ResourceFailed < StandardError; end
    class ResourceSkipped < StandardError; end
    class SecretsBackendNotFound < ArgumentError; end
  end
end
