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

  class UserInteractionRequired < Error; end

  class GemDependencyLoadError < Error; end

  class GemDependencyInstallError < Error
    attr_accessor :gem_name
    attr_accessor :version
  end

  class InvalidProfileSignature < Error; end

  class FeatureConfigMissingError < Error; end
  class FeatureConfigTamperedError < Error; end

  class ProfileSignatureRequired < Error; end
end
