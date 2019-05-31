module Inspec
  class Error < StandardError; end

  # dependency resolution
  class CyclicDependencyError < Error; end
  class UnsatisfiedVersionSpecification < Error; end
  class DuplicateDep < Error; end
  class FetcherFailure < Error; end
  class ReporterError < Error; end
  class ImpactError < Error; end

  # Config file loading
  class ConfigError < Error; end
  class ConfigError::MalformedJson < ConfigError; end
  class ConfigError::Invalid < ConfigError; end

  class Input
    class Error < Inspec::Error; end
    class ValidationError < Error
      attr_accessor :input_name
      attr_accessor :input_value
      attr_accessor :input_type
    end
    class TypeError < Error
      attr_accessor :input_type
    end
    class RequiredError < Error
      attr_accessor :input_name
    end
  end

  class InputRegistry
    class Error < Inspec::Error; end
    class ProfileLookupError < Error
      attr_accessor :profile_name
    end
    class InputLookupError < Error
      attr_accessor :profile_name
      attr_accessor :input_name
    end
  end

  class UserInteractionRequired < Error; end
end
