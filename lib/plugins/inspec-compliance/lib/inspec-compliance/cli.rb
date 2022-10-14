require "inspec/dist"

require_relative "api"
require "inspec/feature"

module InspecPlugins
  module Compliance
    class CLI < Inspec.plugin(2, :cli_command)
      include Inspec::Dist
      subcommand_desc "automate SUBCOMMAND or compliance SUBCOMMAND", "#{AUTOMATE_PRODUCT_NAME} commands"

      # desc "login https://SERVER --insecure --user='USER' --ent='ENTERPRISE' --token='TOKEN'", 'Log in to a Chef Compliance/Chef Automate SERVER'
      desc "login", "Log in to a #{AUTOMATE_PRODUCT_NAME} SERVER"
      long_desc <<-LONGDESC
        `login` allows you to use InSpec with #{AUTOMATE_PRODUCT_NAME} Server

        You need to have a token for communication. More information about token retrieval
        is available at:
          https://docs.chef.io/automate/api_tokens
      LONGDESC
      option :insecure, aliases: :k, type: :boolean,
        desc: 'Explicitly allows InSpec to perform "insecure" SSL connections and transfers'
      option :user, type: :string, required: false,
        desc: "Username"
      option :password, type: :string, required: false,
        desc: "Password (#{AUTOMATE_PRODUCT_NAME} Only)"
      option :token, type: :string, required: false,
        desc: "Access token"
      option :refresh_token, type: :string, required: false,
        desc: "#{AUTOMATE_PRODUCT_NAME} refresh token (#{AUTOMATE_PRODUCT_NAME} Only)"
      option :dctoken, type: :string, required: false,
        desc: "Data Collector token (#{AUTOMATE_PRODUCT_NAME} Only)"
      option :ent, type: :string, required: false,
        desc: "Enterprise for #{AUTOMATE_PRODUCT_NAME} reporting (#{AUTOMATE_PRODUCT_NAME} Only)"
      def login(server)
        Inspec.with_feature("inspec-cli-compliance-login") {
          options["server"] = server
          login_response = InspecPlugins::Compliance::API.login(options)
          puts login_response
        }
      end

      desc "profiles", "list all available profiles in #{AUTOMATE_PRODUCT_NAME}"
      option :owner, type: :string, required: false,
        desc: "owner whose profiles to list"
      def profiles
        Inspec.with_feature("inspec-cli-compliance-profiles") {
          begin
            config = InspecPlugins::Compliance::Configuration.new
            return unless loggedin(config)

            # set owner to config
            config["owner"] = options["owner"] || config["user"]

            msg, profiles = InspecPlugins::Compliance::API.profiles(config)
            profiles.sort_by! { |hsh| hsh["title"] }
            if !profiles.empty?
              # iterate over profiles
              headline("Available profiles:")
              profiles.each do |profile|
                owner = profile["owner_id"] || profile["owner"]
                li("#{profile["title"]} v#{profile["version"]} (#{mark_text(owner + "/" + profile["name"])})")
              end
            else
              puts msg if msg != "success"
              puts "Could not find any profiles"
              exit 1
            end
          rescue InspecPlugins::Compliance::ServerConfigurationMissing
            $stderr.puts "\nServer configuration information is missing. Please login using `#{EXEC_NAME} #{subcommand_name} login`"
            exit 1
          end
        }
      end

      desc "exec PROFILE", "executes a #{AUTOMATE_PRODUCT_NAME} profile"
      exec_options
      def exec(*tests)
        Inspec.with_feature("inspec-cli-compliance-exec") {
          begin
            compliance_config = InspecPlugins::Compliance::Configuration.new
            return unless loggedin(compliance_config)

            o = config # o is an Inspec::Config object, provided by a helper method from Inspec::BaseCLI
            diagnose(o)
            configure_logger(o)

            # iterate over tests and add compliance scheme
            tests = tests.map { |t| "compliance://" + InspecPlugins::Compliance::API.sanitize_profile_name(t) }

            runner = Inspec::Runner.new(o)
            tests.each { |target| runner.add_target(target) }

            exit runner.run
          rescue ArgumentError, RuntimeError, Train::UserError => e
            $stderr.puts e.message
            exit 1
          end
        }
      end

      desc "download PROFILE", "downloads a profile from #{AUTOMATE_PRODUCT_NAME}"
      option :name, type: :string,
        desc: "Name of the archive filename (file type will be added)"
      def download(profile_name)
        Inspec.with_feature("inspec-cli-compliance-download") {
          o = options.dup
          configure_logger(o)

          config = InspecPlugins::Compliance::Configuration.new
          return unless loggedin(config)

          profile_name = InspecPlugins::Compliance::API.sanitize_profile_name(profile_name)
          if InspecPlugins::Compliance::API.exist?(config, profile_name)
            puts "Downloading `#{profile_name}`"

            fetcher = InspecPlugins::Compliance::Fetcher.resolve(
              {
                compliance: profile_name,
              }
            )

            # we provide a name, the fetcher adds the extension
            _owner, id = profile_name.split("/")
            file_name = fetcher.fetch(o.name || id)
            puts "Profile stored to #{file_name}"
          else
            puts "Profile #{profile_name} is not available in #{AUTOMATE_PRODUCT_NAME}."
            exit 1
          end
        }
      end

      desc "upload PATH", "uploads a local profile to #{AUTOMATE_PRODUCT_NAME}"
      option :overwrite, type: :boolean, default: false,
        desc: "Overwrite existing profile on Server."
      option :owner, type: :string, required: false,
        desc: "Owner that should own the profile"
      def upload(path) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
        Inspec.with_feature("inspec-cli-compliance-upload") {
          config = InspecPlugins::Compliance::Configuration.new
          return unless loggedin(config)

          # set owner to config
          config["owner"] = options["owner"] || config["user"]

          unless File.exist?(path)
            puts "Directory #{path} does not exist."
            exit 1
          end

          vendor_deps(path, options) if File.directory?(path)

          o = options.dup
          configure_logger(o)

          # only run against the mock backend, otherwise we run against the local system
          o[:backend] = Inspec::Backend.create(Inspec::Config.mock)
          o[:check_mode] = true
          o[:vendor_cache] = Inspec::Cache.new(o[:vendor_cache])

          # check the profile, we only allow to upload valid profiles
          profile = Inspec::Profile.for_target(path, o)

          # start verification process
          error_count = 0
          error = lambda { |msg|
            error_count += 1
            puts msg
          }

          result = profile.check
          unless result[:summary][:valid]
            error.call("Profile check failed. Please fix the profile before upload.")
          else
            puts("Profile is valid")
          end

          # determine user information
          if (config["token"].nil? && config["refresh_token"].nil?) || config["user"].nil?
            error.call("Please login via `#{EXEC_NAME} #{subcommand_name} login`")
          end

          # read profile name from inspec.yml
          profile_name = profile.params[:name]

          # read profile version from inspec.yml
          profile_version = profile.params[:version]

          # check that the profile is not uploaded already,
          # confirm upload to the user (overwrite with --force)
          if InspecPlugins::Compliance::API.exist?(config, "#{config["owner"]}/#{profile_name}##{profile_version}") && !options["overwrite"]
            error.call("Profile exists on the server, use --overwrite")
          end

          # abort if we found an error
          if error_count > 0
            puts "Found #{error_count} error(s)"
            exit 1
          end

          # if it is a directory, tar it to tmp directory
          generated = false
          if File.directory?(path)
            generated = true
            archive_path = Dir::Tmpname.create([profile_name, ".tar.gz"]) {}
            puts "Generate temporary profile archive at #{archive_path}"
            profile.archive({ output: archive_path, ignore_errors: false, overwrite: true })
          else
            archive_path = path
          end

          puts "Start upload to #{config["owner"]}/#{profile_name}"
          pname = ERB::Util.url_encode(profile_name)

          puts "Uploading to #{AUTOMATE_PRODUCT_NAME}"

          success, msg = InspecPlugins::Compliance::API.upload(config, config["owner"], pname, archive_path)

          # delete temp file if it was temporary generated
          File.delete(archive_path) if generated && File.exist?(archive_path)

          if success
            puts "Successfully uploaded profile"
          else
            puts "Error during profile upload:"
            puts msg
            exit 1
          end
        }
      end

      desc "version", "displays the version of the #{AUTOMATE_PRODUCT_NAME} server"
      def version
        Inspec.with_feature("inspec-cli-compliance-version") {
          begin
            config = InspecPlugins::Compliance::Configuration.new
            info = InspecPlugins::Compliance::API.version(config)
            if !info.nil? && info["build_timestamp"]
              # key info["api"] is not longer available in latest version api response
              puts "Name: automate"
              puts "Version: #{info["build_timestamp"]}"
            else
              puts "Could not determine server version."
              exit 1
            end
          rescue InspecPlugins::Compliance::ServerConfigurationMissing
            puts "\nServer configuration information is missing. Please login using `#{EXEC_NAME} #{subcommand_name} login`"
            exit 1
          end
        }
      end

      desc "logout", "user logout from #{AUTOMATE_PRODUCT_NAME}"
      def logout
        Inspec.with_feature("inspec-cli-compliance-logout") {
          config = InspecPlugins::Compliance::Configuration.new
          unless config.supported?(:oidc) || config["token"].nil? || config["server_type"] == "automate"
            config = InspecPlugins::Compliance::Configuration.new
            url = "#{config["server"]}/logout"
            InspecPlugins::Compliance::HTTP.post(url, config["token"], config["insecure"], !config.supported?(:oidc))
          end
          success = config.destroy

          if success
            puts "Successfully logged out"
          else
            puts "Could not log out"
          end
        }
      end

      private

      def loggedin(config)
        serverknown = !config["server"].nil?
        puts "You need to login first with `#{EXEC_NAME} #{subcommand_name} login`" unless serverknown
        serverknown
      end

      def subcommand_name
        @_invocations[Inspec::InspecCLI]&.first || "automate"
      end
    end

    # register the subcommand to InSpec CLI registry
    # Inspec::Plugins::CLI.add_subcommand(InspecPlugins::ComplianceCLI, 'compliance', 'compliance SUBCOMMAND ...', 'Chef InspecPlugins::Compliance commands', {})
  end
end
