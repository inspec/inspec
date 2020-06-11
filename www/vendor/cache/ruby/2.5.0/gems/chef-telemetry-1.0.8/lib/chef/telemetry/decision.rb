require "chef-config/path_helper"
require "chef-config/windows"

# Decision allows us to inspect whether the user has made a decision to opt in or opt out of telemetry.
class Chef
  class Telemetry
    module Decision
      OPT_OUT_FILE = "telemetry_opt_out".freeze
      OPT_IN_FILE = "telemetry_opt_in".freeze

      class << self
        def opt_out?
          # We check that the user has made a decision so that we can have a default setting for robots
          user_opted_out? || env_opt_out? || local_opt_out? || !made?
        end

        # Check whether the user has made an explicit decision on their participation.
        def made?
          user_opted_in? || user_opted_out?
        end

        def user_opted_out?
          File.exist?(File.join(home, OPT_OUT_FILE))
        end

        def user_opted_in?
          File.exist?(File.join(home, OPT_IN_FILE))
        end

        def env_opt_out?
          ENV.key?("CHEF_TELEMETRY_OPT_OUT")
        end

        def local_opt_out?
          found = false
          full_path = working_directory.split(File::SEPARATOR)
          (full_path.length - 1).downto(0) do |i|
            candidate = File.join(full_path[0..i], ".chef", OPT_OUT_FILE)
            if File.exist?(candidate)
              # TODO: push up logging
              # Log.info "Found opt out at: #{candidate}"
              found = true
              break
            end
          end
          found
        end

        private

        def working_directory
          a = if ChefConfig.windows?
                ENV["CD"]
              else
                ENV["PWD"]
              end || Dir.pwd

          a
        end

        def home
          ChefConfig::PathHelper.home(".chef")
        end
      end
    end
  end
end # Chef
