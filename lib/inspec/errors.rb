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

  class AttributeError < Error; end
  class AttributeValidationError < AttributeError; end
  class AttributeTypeError < AttributeError; end
  class AttributeRequiredError < AttributeError; end

  class AttributeRegistryError < Error; end
  class AttributeRegistryUnknownProfile < AttributeRegistryError; end
  class AttributeRegistryUnknownAttribute < AttributeRegistryError; end
end
