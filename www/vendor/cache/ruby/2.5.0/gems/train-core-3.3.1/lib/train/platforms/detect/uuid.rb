require "digest/sha1"
require "securerandom"
require "json"

module Train::Platforms::Detect
  class UUID
    include Train::Platforms::Detect::Helpers::OSCommon

    def initialize(platform)
      @platform = platform
      @backend = @platform.backend
    end

    def find_or_create_uuid
      # for api transports uuid is defined on the connection
      if defined?(@backend.unique_identifier)
        uuid_from_string(@backend.unique_identifier)
      elsif @platform.unix?
        unix_uuid
      elsif @platform.windows?
        windows_uuid
      else
        if @platform[:uuid_command]
          result = @backend.run_command(@platform[:uuid_command])
          return uuid_from_string(result.stdout.chomp) if result.exit_status == 0 && !result.stdout.empty?
        end

        raise "Could not find platform uuid! Please set a uuid_command for your platform."
      end
    end
  end
end
