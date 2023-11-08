# copyright: 2017, Chef Software Inc.

module Inspec
  module Exceptions
    class InputsFileDoesNotExist < ArgumentError; end
    class InputsFileNotReadable < ArgumentError; end
    class ProfileLoadFailed < StandardError; end
    class ResourceFailed < StandardError; end
    class ResourceSkipped < StandardError; end
    class SecretsBackendNotFound < ArgumentError; end
    class ProfileValidationKeyNotFound < ArgumentError; end
    class ProfileSigningKeyNotFound < ArgumentError; end
    class WaiversFileNotReadable < ArgumentError; end
    class WaiversFileDoesNotExist < ArgumentError; end
    class WaiversFileInvalidFormatting < ArgumentError; end
    class InvalidAuditLogOption < ArgumentError; end
  end
end
