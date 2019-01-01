# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

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

  class Attribute
    class Error < Inspec::Error; end
    class ValidationError < Error
      attr_accessor :attribute_name
      attr_accessor :attribute_value
      attr_accessor :attribute_type
    end
    class TypeError < Error
      attr_accessor :attribute_type
    end
    class RequiredError < Error
      attr_accessor :attribute_name
    end
  end

  class AttributeRegistry
    class Error < Inspec::Error; end
    class ProfileError < Error
      attr_accessor :profile_name
    end
    class AttributeError < Error
      attr_accessor :profile_name
      attr_accessor :attribute_name
    end
  end

  class UserInteractionRequired < Error; end
end
