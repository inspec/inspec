require "license_acceptance/config"

module LicenseAcceptance
  module Logger

    def self.initialize(logger)
      @logger ||= logger
    end

    def self.logger
      @logger
    end

    def logger
      Logger.logger
    end

  end
end
