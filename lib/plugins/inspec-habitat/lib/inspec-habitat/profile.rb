# encoding: utf-8
# author: Adam Leff

require 'inspec/profile_vendor'
require 'mixlib/shellout'
require 'tomlrb'

module InspecPlugins
  module Habitat
    class Profile
      attr_reader :options, :path, :profile

      def self.create(path, options = {})
        creator = new(path, options)
        hart_file = creator.create
        creator.copy(hart_file)
      ensure
        creator.delete_work_dir
      end

      def self.setup(path)
        new(path).setup
      end

      def self.upload(path, options = {})
        uploader = new(path, options)
        uploader.upload
      ensure
        uploader.delete_work_dir
      end

      def initialize(path, options = {})
        @path    = path
        @options = options
        @cli_config = nil

        log_level = options.fetch('log_level', 'info')
        @log = Inspec::Log
        @log.level(log_level.to_sym)
      end

      def create
        @log.info("Creating a Habitat artifact for profile: #{path}")

        validate_habitat_installed
        validate_habitat_origin
        create_profile_object
        verify_profile
        vendor_profile_dependencies
        copy_profile_to_work_dir
        create_habitat_directories(work_dir)
        create_plan(work_dir)
        create_run_hook(work_dir)
        create_default_config(work_dir)

        # returns the path to the .hart file in the work directory
        build_hart
      rescue => e
        @log.debug(e.backtrace.join("\n"))
        exit_with_error(
          'Unable to generate Habitat artifact.',
          "#{e.class} -- #{e.message}",
        )
      end

      def copy(hart_file)
        validate_output_dir

        @log.info("Copying artifact to #{output_dir}...")
        copy_hart(hart_file)
      end

      def upload
        validate_habitat_auth_token
        hart_file = create
        upload_hart(hart_file)
      rescue => e
        @log.debug(e.backtrace.join("\n"))
        exit_with_error(
          'Unable to upload Habitat artifact.',
          "#{e.class} -- #{e.message}",
        )
      end

      def delete_work_dir
        @log.debug("Deleting work directory #{work_dir}")
        FileUtils.rm_rf(work_dir) if Dir.exist?(work_dir)
      end

      def setup
        @log.info("Setting up profile at #{path} for Habitat...")
        create_profile_object
        verify_profile
        vendor_profile_dependencies
        create_habitat_directories(path)
        create_plan(path)
        create_run_hook(path)
        create_default_config(path)
      end

      private

      def create_profile_object
        @profile = Inspec::Profile.for_target(
          path,
          backend: Inspec::Backend.create(Inspec::Config.mock),
        )
      end

      def verify_profile
        @log.info('Checking to see if the profile is valid...')

        unless profile.check[:summary][:valid]
          exit_with_error('Profile check failed. Please fix the profile before creating a Habitat artifact.')
        end

        @log.info('Profile is valid.')
      end

      def vendor_profile_dependencies
        profile_vendor = Inspec::ProfileVendor.new(path)
        if profile_vendor.lockfile.exist? && profile_vendor.cache_path.exist?
          @log.info("Profile's dependencies are already vendored, skipping vendor process.")
        else
          @log.info("Vendoring the profile's dependencies...")
          profile_vendor.vendor!

          @log.info('Ensuring all vendored content has read permissions...')
          profile_vendor.make_readable

          # refresh the profile object since the profile now has new files
          create_profile_object
        end
      end

      def validate_habitat_installed
        @log.info('Checking to see if Habitat is installed...')
        cmd = Mixlib::ShellOut.new('hab --version')
        cmd.run_command
        exit_with_error('Unable to run Habitat commands.', cmd.stderr) if cmd.error?
      end

      def validate_habitat_origin
        exit_with_error(
          'Unable to determine Habitat origin name.',
          'Run `hab setup` or set the HAB_ORIGIN environment variable.',
        ) if habitat_origin.nil?
      end

      def validate_habitat_auth_token
        exit_with_error(
          'Unable to determine Habitat auth token for publishing.',
          'Run `hab setup` or set the HAB_AUTH_TOKEN environment variable.',
        ) if habitat_auth_token.nil?
      end

      def validate_output_dir
        exit_with_error("Output directory #{output_dir} is not a directory or does not exist.") unless
          File.directory?(output_dir)
      end

      def work_dir
        return @work_dir if @work_dir

        @work_dir ||= Dir.mktmpdir('inspec-habitat-exporter')
        @log.debug("Generated work directory #{@work_dir}")

        @work_dir
      end

      def create_habitat_directories(parent_directory)
        [
          File.join(parent_directory, 'habitat'),
          File.join(parent_directory, 'habitat', 'hooks'),
        ].each do |dir|
          Dir.mkdir(dir) unless Dir.exist?(dir)
        end
      end

      def copy_profile_to_work_dir
        @log.info('Copying profile contents to the work directory...')
        profile.files.each do |f|
          src = File.join(profile.root_path, f)
          dst = File.join(work_dir, f)
          if File.directory?(f)
            @log.debug("Creating directory #{dst}")
            FileUtils.mkdir_p(dst)
          else
            @log.debug("Copying file #{src} to #{dst}")
            FileUtils.cp_r(src, dst)
          end
        end
      end

      def create_plan(directory)
        plan_file = File.join(directory, 'habitat', 'plan.sh')
        @log.info("Generating Habitat plan at #{plan_file}...")
        File.write(plan_file, plan_contents)
      end

      def create_run_hook(directory)
        run_hook_file = File.join(directory, 'habitat', 'hooks', 'run')
        @log.info("Generating a Habitat run hook at #{run_hook_file}...")
        File.write(run_hook_file, run_hook_contents)
      end

      def create_default_config(directory)
        default_toml = File.join(directory, 'habitat', 'default.toml')
        @log.info("Generating Habitat's default.toml configuration...")
        File.write(default_toml, 'sleep_time = 300')
      end

      def build_hart
        @log.info('Building our Habitat artifact...')

        env = {
          'TERM'               => 'vt100',
          'HAB_ORIGIN'         => habitat_origin,
          'HAB_NONINTERACTIVE' => 'true',
        }

        env['RUST_LOG'] = 'debug' if @log.level == :debug

        # TODO: Would love to use Mixlib::ShellOut here, but it doesn't
        # seem to preserve the STDIN tty, and docker gets angry.
        Dir.chdir(work_dir) do
          unless system(env, 'hab pkg build .')
            exit_with_error('Unable to build the Habitat artifact.')
          end
        end

        hart_files = Dir.glob(File.join(work_dir, 'results', '*.hart'))

        if hart_files.length > 1
          exit_with_error('More than one Habitat artifact was created which was not expected.')
        elsif hart_files.empty?
          exit_with_error('No Habitat artifact was created.')
        end

        hart_files.first
      end

      def copy_hart(working_dir_hart)
        hart_basename = File.basename(working_dir_hart)
        dst = File.join(output_dir, hart_basename)
        FileUtils.cp(working_dir_hart, dst)

        dst
      end

      def upload_hart(hart_file)
        @log.info('Uploading the Habitat artifact to our Depot...')

        env = {
          'TERM'               => 'vt100',
          'HAB_AUTH_TOKEN'     => habitat_auth_token,
          'HAB_NONINTERACTIVE' => 'true',
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

        @log.info('Upload complete!')
      end

      def habitat_origin
        ENV['HAB_ORIGIN'] || habitat_cli_config['origin']
      end

      def habitat_auth_token
        ENV['HAB_AUTH_TOKEN'] || habitat_cli_config['auth_token']
      end

      def habitat_cli_config
        return @cli_config if @cli_config

        config_file = File.join(ENV['HOME'], '.hab', 'etc', 'cli.toml')
        return {} unless File.exist?(config_file)

        @cli_config = Tomlrb.load_file(config_file)
      end

      def output_dir
        options[:output_dir] || Dir.pwd
      end

      def exit_with_error(*errors)
        errors.each do |error_msg|
          @log.error(error_msg)
        end

        exit 1
      end

      def package_name
        "inspec-profile-#{profile.name}"
      end

      def plan_contents
        plan = <<~EOL
          pkg_name=#{package_name}
          pkg_version=#{profile.version}
          pkg_origin=#{habitat_origin}
          pkg_deps=(chef/inspec)
        EOL

        plan += "pkg_license='#{profile.metadata.params[:license]}'\n\n" if profile.metadata.params[:license]

        plan += <<~EOL
          do_setup_environment() {
            ARCHIVE_PATH="$HAB_CACHE_SRC_PATH/$pkg_dirname/$pkg_name-$pkg_version.tar.gz"
          }

          do_build() {
            if [ ! -f $PLAN_CONTEXT/../inspec.yml ]; then
              exit_with 'Cannot find inspec.yml. Please build from profile root.' 1
            fi

            local profile_files=($(ls $PLAN_CONTEXT/../ -I habitat -I results))
            local profile_location="$HAB_CACHE_SRC_PATH/$pkg_dirname/build"
            mkdir -p $profile_location

            build_line "Copying profile files to $profile_location"
            cp -R ${profile_files[@]} $profile_location

            build_line "Archiving $ARCHIVE_PATH"
            inspec archive "$HAB_CACHE_SRC_PATH/$pkg_dirname/build" \
                           -o $ARCHIVE_PATH \
                           --overwrite
          }

          do_install() {
            mkdir -p $pkg_prefix/profiles
            cp $ARCHIVE_PATH $pkg_prefix/profiles
          }
        EOL

        plan
      end

      def run_hook_contents
        <<~EOL
          #!{{pkgPathFor "core/bash"}}/bin/bash

          # Redirect stderr to stdout
          # This will be captured by Habitat and viewable via `journalctl`
          # NOTE: We might want log to "{{pkg.svc_path}}/logs" and handle rotation
          exec 2>&1

          # InSpec will try to create a .cache directory in the user's home directory
          # so this needs to be someplace writeable by the hab user
          export HOME={{pkg.svc_var_path}}

          RESULTS_DIR="{{pkg.svc_var_path}}/inspec_results"
          RESULTS_FILE="${RESULTS_DIR}/{{pkg.name}}.json"

          # Create a directory for InSpec reporter output
          mkdir -p $(dirname $RESULTS_FILE)

          while true; do
            echo "Executing InSpec for {{pkg.ident}}"
            inspec exec "{{pkg.path}}/profiles/*" --reporter=json > ${RESULTS_FILE}

            EXIT_STATUS=$?
            if [ $EXIT_STATUS -eq 0 ]; then
              echo "InSpec run completed successfully."
            elif [ $EXIT_STATUS -eq 100 ]; then
              echo "InSpec run completed successfully, with at least 1 failed test"
            elif [ $EXIT_STATUS -eq 101 ]; then
              echo "InSpec run completed successfully, with skipped tests and no failures"
            else
              echo "InSpec run did not complete successfully. Exited with status: $?"
            fi
            echo "Results located here: ${RESULTS_FILE}"

            echo "Sleeping for {{cfg.sleep_time}} seconds"
            sleep {{cfg.sleep_time}}
          done
        EOL
      end
    end
  end
end
