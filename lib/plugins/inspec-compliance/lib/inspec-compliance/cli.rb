
require_relative 'api'

module InspecPlugins
  module Compliance
    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'compliance SUBCOMMAND', 'Chef Compliance commands'

      # desc "login https://SERVER --insecure --user='USER' --ent='ENTERPRISE' --token='TOKEN'", 'Log in to a Chef Compliance/Chef Automate SERVER'
      desc 'login', 'Log in to a Chef Compliance/Chef Automate SERVER'
      long_desc <<-LONGDESC
        `login` allows you to use InSpec with Chef Automate or a Chef Compliance Server

        You need to a token for communication. More information about token retrieval
        is available at:
          https://docs.chef.io/api_automate.html#authentication-methods
          https://docs.chef.io/api_compliance.html#obtaining-an-api-token
      LONGDESC
      option :insecure, aliases: :k, type: :boolean,
        desc: 'Explicitly allows InSpec to perform "insecure" SSL connections and transfers'
      option :user, type: :string, required: false,
        desc: 'Username'
      option :password, type: :string, required: false,
        desc: 'Password (Chef Compliance Only)'
      option :token, type: :string, required: false,
        desc: 'Access token'
      option :refresh_token, type: :string, required: false,
        desc: 'Chef Compliance refresh token (Chef Compliance Only)'
      option :dctoken, type: :string, required: false,
        desc: 'Data Collector token (Chef Automate Only)'
      option :ent, type: :string, required: false,
        desc: 'Enterprise for Chef Automate reporting (Chef Automate Only)'
      def login(server)
        options['server'] = server
        InspecPlugins::Compliance::API.login(options)
        config = InspecPlugins::Compliance::Configuration.new
        puts "Stored configuration for Chef #{config['server_type'].capitalize}: #{config['server']}' with user: '#{config['user']}'"
      end

      desc 'profiles', 'list all available profiles in Chef Compliance'
      option :owner, type: :string, required: false,
        desc: 'owner whose profiles to list'
      def profiles
        config = InspecPlugins::Compliance::Configuration.new
        return if !loggedin(config)

        # set owner to config
        config['owner'] = options['owner'] || config['user']

        msg, profiles = InspecPlugins::Compliance::API.profiles(config)
        profiles.sort_by! { |hsh| hsh['title'] }
        if !profiles.empty?
          # iterate over profiles
          headline('Available profiles:')
          profiles.each { |profile|
            owner = profile['owner_id'] || profile['owner']
            li("#{profile['title']} v#{profile['version']} (#{mark_text(owner + '/' + profile['name'])})")
          }
        else
          puts msg if msg != 'success'
          puts 'Could not find any profiles'
          exit 1
        end
      rescue InspecPlugins::Compliance::ServerConfigurationMissing
        $stderr.puts "\nServer configuration information is missing. Please login using `inspec compliance login`"
        exit 1
      end

      desc 'exec PROFILE', 'executes a Chef Compliance profile'
      exec_options
      def exec(*tests)
        config = InspecPlugins::Compliance::Configuration.new
        return if !loggedin(config)
        o = opts(:exec).dup
        diagnose(o)
        configure_logger(o)

        # iterate over tests and add compliance scheme
        tests = tests.map { |t| 'compliance://' + InspecPlugins::Compliance::API.sanitize_profile_name(t) }

        runner = Inspec::Runner.new(o)
        tests.each { |target| runner.add_target(target) }

        exit runner.run
      rescue ArgumentError, RuntimeError, Train::UserError => e
        $stderr.puts e.message
        exit 1
      end

      desc 'download PROFILE', 'downloads a profile from Chef Compliance'
      option :name, type: :string,
        desc: 'Name of the archive filename (file type will be added)'
      def download(profile_name)
        o = options.dup
        configure_logger(o)

        config = InspecPlugins::Compliance::Configuration.new
        return if !loggedin(config)

        profile_name = InspecPlugins::Compliance::API.sanitize_profile_name(profile_name)
        if InspecPlugins::Compliance::API.exist?(config, profile_name)
          puts "Downloading `#{profile_name}`"

          fetcher = InspecPlugins::Compliance::Fetcher.resolve(
            {
              compliance: profile_name,
            },
          )

          # we provide a name, the fetcher adds the extension
          _owner, id = profile_name.split('/')
          file_name = fetcher.fetch(o.name || id)
          puts "Profile stored to #{file_name}"
        else
          puts "Profile #{profile_name} is not available in Chef Compliance."
          exit 1
        end
      end

      desc 'upload PATH', 'uploads a local profile to Chef Compliance'
      option :overwrite, type: :boolean, default: false,
        desc: 'Overwrite existing profile on Server.'
      option :owner, type: :string, required: false,
        desc: 'Owner that should own the profile'
      def upload(path) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, PerceivedComplexity, Metrics/CyclomaticComplexity
        config = InspecPlugins::Compliance::Configuration.new
        return if !loggedin(config)

        # set owner to config
        config['owner'] = options['owner'] || config['user']

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
          error.call('Profile check failed. Please fix the profile before upload.')
        else
          puts('Profile is valid')
        end

        # determine user information
        if (config['token'].nil? && config['refresh_token'].nil?) || config['user'].nil?
          error.call('Please login via `inspec compliance login`')
        end

        # read profile name from inspec.yml
        profile_name = profile.params[:name]

        # read profile version from inspec.yml
        profile_version = profile.params[:version]

        # check that the profile is not uploaded already,
        # confirm upload to the user (overwrite with --force)
        if InspecPlugins::Compliance::API.exist?(config, "#{config['owner']}/#{profile_name}##{profile_version}") && !options['overwrite']
          error.call('Profile exists on the server, use --overwrite')
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
          archive_path = Dir::Tmpname.create([profile_name, '.tar.gz']) {}
          puts "Generate temporary profile archive at #{archive_path}"
          profile.archive({ output: archive_path, ignore_errors: false, overwrite: true })
        else
          archive_path = path
        end

        puts "Start upload to #{config['owner']}/#{profile_name}"
        pname = ERB::Util.url_encode(profile_name)

        if InspecPlugins::Compliance::API.is_automate_server?(config) || InspecPlugins::Compliance::API.is_automate2_server?(config)
          puts 'Uploading to Chef Automate'
        else
          puts 'Uploading to Chef Compliance'
        end
        success, msg = InspecPlugins::Compliance::API.upload(config, config['owner'], pname, archive_path)

        # delete temp file if it was temporary generated
        File.delete(archive_path) if generated && File.exist?(archive_path)

        if success
          puts 'Successfully uploaded profile'
        else
          puts 'Error during profile upload:'
          puts msg
          exit 1
        end
      end

      desc 'version', 'displays the version of the Chef Compliance server'
      def version
        config = InspecPlugins::Compliance::Configuration.new
        info = InspecPlugins::Compliance::API.version(config)
        if !info.nil? && info['version']
          puts "Name:    #{info['api']}"
          puts "Version: #{info['version']}"
        else
          puts 'Could not determine server version.'
          exit 1
        end
      rescue InspecPlugins::Compliance::ServerConfigurationMissing
        puts "\nServer configuration information is missing. Please login using `inspec compliance login`"
        exit 1
      end

      desc 'logout', 'user logout from Chef Compliance'
      def logout
        config = InspecPlugins::Compliance::Configuration.new
        unless config.supported?(:oidc) || config['token'].nil? || config['server_type'] == 'automate'
          config = InspecPlugins::Compliance::Configuration.new
          url = "#{config['server']}/logout"
          InspecPlugins::Compliance::HTTP.post(url, config['token'], config['insecure'], !config.supported?(:oidc))
        end
        success = config.destroy

        if success
          puts 'Successfully logged out'
        else
          puts 'Could not log out'
        end
      end

      private

      def loggedin(config)
        serverknown = !config['server'].nil?
        puts 'You need to login first with `inspec compliance login`' if !serverknown
        serverknown
      end
    end

    # register the subcommand to InSpec CLI registry
    # Inspec::Plugins::CLI.add_subcommand(InspecPlugins::ComplianceCLI, 'compliance', 'compliance SUBCOMMAND ...', 'Chef InspecPlugins::Compliance commands', {})
  end
end
