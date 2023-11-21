module Inspec
  class LicenseContext
    # Returns license_context object used by InSpec

    # Returns cached license_context
    def self.cached
      @license_context ||= nil
    end

    # Caches license_context
    def self.cached=(license_context)
      @license_context ||= license_context
    end
  end
end