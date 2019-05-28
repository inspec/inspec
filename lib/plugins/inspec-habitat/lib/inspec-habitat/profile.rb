require 'inspec/profile_vendor'
require 'mixlib/shellout'
require 'tomlrb'
require 'ostruct'
require 'inspec/dist'

module InspecPlugins
  module Habitat
    class Profile
      include Inspec::Dist

      attr_reader :logger
      def initialize(path, options = {})
        @path    = path
        @options = options
        @logger  = Inspec::Log
        logger.level(options.fetch(:log_level, 'info').to_sym)
      end

      def create
        logger.info("Creating a Habitat artifact for '#{@path}'...")

        # Need to create working directory first so `ensure` doesn't error
        working_dir = create_working_dir

        habitat_config = read_habitat_config
        verify_habitat_setup(habitat_config)

        output_dir = @options[:output_dir] || Dir.pwd
        unless File.directory?(output_dir)
          exit_with_error("Output directory #{output_dir} is not a directory " \
                          'or does not exist.')
        end

        duplicated_profile = duplicate_profile(@path, working_dir)
        prepare_profile!(duplicated_profile)

        hart_file = build_hart(working_dir, habitat_config)

        logger.debug("Copying artifact to #{output_dir}...")
        destination = File.join(output_dir, File.basename(hart_file))
        FileUtils.cp(hart_file, destination)

        logger.info("Habitat artifact '#{@destination}' created.")
        destination
      rescue => e
        logger.debug(e.backtrace.join("\n"))
        exit_with_error('Unable to create Habitat artifact.')
      ensure
        if Dir.exist?(working_dir)
          logger.debug("Deleting working directory #{working_dir}")
          FileUtils.rm_rf(working_dir)
        end
      end

      def setup(profile = profile_from_path(@path))
        path = profile.root_path
        logger.debug("Setting up #{path} for Habitat...")

        plan_file = File.join(path, 'habitat', 'plan.sh')
        logger.info("Generating Habitat plan at #{plan_file}...")
        vars = {
          profile: profile,
          habitat_origin: read_habitat_config['origin'],
        }
        create_file_from_template(plan_file, 'plan.sh.erb', vars)

        run_hook_file = File.join(path, 'habitat', 'hooks', 'run')
        logger.info("Generating a Habitat run hook at #{run_hook_file}...")
        create_file_from_template(run_hook_file, 'hooks/run.erb')

        default_toml = File.join(path, 'habitat', 'default.toml')
        logger.info("Generating a Habitat default.toml at #{default_toml}...")
        create_file_from_template(default_toml, 'default.toml.erb')

        config = File.join(path, 'habitat', 'config', 'inspec_exec_config.json')
        logger.info("Generating #{config} for `#{EXEC_NAME} exec`...")
        create_file_from_template(config, 'config/inspec_exec_config.json.erb')
      end

      def upload
        habitat_config = read_habitat_config

        if habitat_config['auth_token'].nil?
          exit_with_error(
            'Unable to determine Habitat auth token for uploading.',
            'Run `hab setup` or set the HAB_AUTH_TOKEN environment variable.',
          )
        end

        # Run create command to create habitat artifact
        hart = create

        logger.info("Uploading Habitat artifact #{hart}...")
        upload_hart(hart, habitat_config)
        logger.info("Habitat artifact #{hart} uploaded.")
      rescue => e
        logger.debug(e.backtrace.join("\n"))
        exit_with_error('Unable to upload Habitat artifact.')
      end

      private

      def create_working_dir
        working_dir = Dir.mktmpdir
        logger.debug("Generated working directory #{working_dir}")
        working_dir
      end

      def duplicate_profile(path, working_dir)
        profile = profile_from_path(path)
        copy_profile_to_working_dir(profile, working_dir)
        profile_from_path(working_dir)
      end

      def prepare_profile!(profile)
        vendored_profile = vendor_profile_dependencies!(profile)
        verify_profile(vendored_profile)
        setup(vendored_profile)
      end

      def profile_from_path(path)
        Inspec::Profile.for_target(
          path,
          backend: Inspec::Backend.create(Inspec::Config.mock),
        )
      end

      def copy_profile_to_working_dir(profile, working_dir)
        logger.debug('Copying profile contents to the working directory...')
        profile.files.each do |profile_file|
          next if File.extname(profile_file) == '.hart'

          src = File.join(profile.root_path, profile_file)
          dst = File.join(working_dir, profile_file)
          if File.directory?(profile_file)
            logger.debug("Creating directory #{dst}")
            FileUtils.mkdir_p(dst)
          else
            logger.debug("Copying file #{src} to #{dst}")
            FileUtils.cp_r(src, dst)
          end
        end
      end

      def verify_profile(profile)
        logger.debug('Checking to see if the profile is valid...')

        unless profile.check[:summary][:valid]
          exit_with_error('Profile check failed. Please fix the profile ' \
                          'before creating a Habitat artifact.')
        end

        logger.debug('Profile is valid.')
      end

      def vendor_profile_dependencies!(profile)
        profile_vendor = Inspec::ProfileVendor.new(profile.root_path)
        if profile_vendor.lockfile.exist? && profile_vendor.cache_path.exist?
          logger.debug("Profile's dependencies are already vendored, skipping " \
                    'vendor process.')
        else
          logger.debug("Vendoring the profile's dependencies...")
          profile_vendor.vendor!

          logger.debug('Ensuring all vendored content has read permissions...')
          profile_vendor.make_readable
        end

        # Return new profile since it has changed
        Inspec::Profile.for_target(
          profile.root_path,
          backend: Inspec::Backend.create(Inspec::Config.mock),
        )
      end

      def verify_habitat_setup(habitat_config)
        logger.debug('Checking to see if Habitat is installed...')
        cmd = Mixlib::ShellOut.new('hab --version')
        cmd.run_command
        if cmd.error?
          exit_with_error('Unable to run Habitat commands.', cmd.stderr)
        end

        if habitat_config['origin'].nil?
          exit_with_error(
            'Unable to determine Habitat origin name.',
            'Run `hab setup` or set the HAB_ORIGIN environment variable.',
          )
        end
      end

      def create_file_from_template(file, template, vars = {})
        FileUtils.mkdir_p(File.dirname(file))
        template_path = File.join(__dir__, '../../templates/habitat', template)
        contents = ERB.new(File.read(template_path))
                      .result(OpenStruct.new(vars).instance_eval { binding })
        File.write(file, contents)
      end

      def build_hart(working_dir, habitat_config)
        logger.debug('Building our Habitat artifact...')

        env = {
          'TERM'               => 'vt100',
          'HAB_ORIGIN'         => habitat_config['origin'],
          'HAB_NONINTERACTIVE' => 'true',
        }

        env['RUST_LOG'] = 'debug' if logger.level == :debug

        # TODO: Would love to use Mixlib::ShellOut here, but it doesn't
        # seem to preserve the STDIN tty, and docker gets angry.
        Dir.chdir(working_dir) do
          unless system(env, 'hab pkg build .')
            exit_with_error('Unable to build the Habitat artifact.')
          end
        end

        hart_files = Dir.glob(File.join(working_dir, 'results', '*.hart'))

        if hart_files.length > 1
          exit_with_error('More than one Habitat artifact was created which ' \
                          'was not expected.')
        elsif hart_files.empty?
          exit_with_error('No Habitat artifact was created.')
        end

        hart_files.first
      end

      def upload_hart(hart_file, habitat_config)
        logger.debug("Uploading '#{hart_file}' to the Habitat Builder Depot...")

        config = habitat_config

        env = {
          'HAB_AUTH_TOKEN'     => config['auth_token'],
          'HAB_NONINTERACTIVE' => 'true',
          'HAB_ORIGIN'         => config['origin'],
          'TERM'               => 'vt100',
        }

        env['HAB_DEPOT_URL'] = ENV['HAB_DEPOT_URL'] if ENV['HAB_DEPOT_URL']

        cmd = Mixlib::ShellOut.new("hab pkg upload #{hart_file}", env: env)
        cmd.run_command
        if cmd.error?
          exit_with_error(
            'Unable to upload Habitat artifact to the Depot.',
            cmd.stdout,
            cmd.stderr,
          )
        end

        logger.debug('Upload complete!')
      end

      def read_habitat_config
        cli_toml = File.join(ENV['HOME'], '.hab', 'etc', 'cli.toml')
        cli_toml = '/hab/etc/cli.toml' unless File.exist?(cli_toml)
        cli_config = File.exist?(cli_toml) ? Tomlrb.load_file(cli_toml) : {}
        cli_config['origin'] ||= ENV['HAB_ORIGIN']
        cli_config['auth_token'] ||= ENV['HAB_AUTH_TOKEN']
        cli_config
      end

      def exit_with_error(*errors)
        errors.each do |error_msg|
          logger.error(error_msg)
        end

        exit 1
      end
    end
  end
end
