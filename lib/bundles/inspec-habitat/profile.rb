# encoding: utf-8
# author: Adam Leff

require 'inspec/profile_vendor'
require 'mixlib/shellout'
require 'tomlrb'

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

      log_level = options.fetch('log_level', 'info')
      Habitat::Log.level(log_level.to_sym)
    end

    def create
      Habitat::Log.info("Creating a Habitat artifact for profile: #{path}")

      validate_habitat_installed
      validate_habitat_origin
      create_profile_object
      verify_profile
      vendor_profile_dependencies
      copy_profile_to_work_dir
      create_habitat_directories(work_dir)
      create_plan(work_dir)
      create_run_hook(work_dir)
      create_settings_file(work_dir)
      create_default_config(work_dir)

      # returns the path to the .hart file in the work directory
      build_hart
    rescue => e
      Habitat::Log.debug(e.backtrace.join("\n"))
      exit_with_error(
        'Unable to generate Habitat artifact.',
        "#{e.class} -- #{e.message}",
      )
    end

    def copy(hart_file)
      validate_output_dir

      Habitat::Log.info("Copying artifact to #{output_dir}...")
      copy_hart(hart_file)
    end

    def upload
      validate_habitat_auth_token
      hart_file = create
      upload_hart(hart_file)
    rescue => e
      Habitat::Log.debug(e.backtrace.join("\n"))
      exit_with_error(
        'Unable to upload Habitat artifact.',
        "#{e.class} -- #{e.message}",
      )
    end

    def delete_work_dir
      Habitat::Log.debug("Deleting work directory #{work_dir}")
      FileUtils.rm_rf(work_dir) if Dir.exist?(work_dir)
    end

    def setup
      Habitat::Log.info("Setting up profile at #{path} for Habitat...")
      create_profile_object
      verify_profile
      vendor_profile_dependencies
      create_habitat_directories(path)
      create_plan(path)
      create_run_hook(path)
      create_settings_file(path)
      create_default_config(path)
    end

    private

    def create_profile_object
      @profile = Inspec::Profile.for_target(
        path,
        backend: Inspec::Backend.create(target: 'mock://'),
      )
    end

    def verify_profile
      Habitat::Log.info('Checking to see if the profile is valid...')

      unless profile.check[:summary][:valid]
        exit_with_error('Profile check failed. Please fix the profile before creating a Habitat artifact.')
      end

      Habitat::Log.info('Profile is valid.')
    end

    def vendor_profile_dependencies
      profile_vendor = Inspec::ProfileVendor.new(path)
      if profile_vendor.lockfile.exist? && profile_vendor.cache_path.exist?
        Habitat::Log.info("Profile's dependencies are already vendored, skipping vendor process.")
      else
        Habitat::Log.info("Vendoring the profile's dependencies...")
        profile_vendor.vendor!

        Habitat::Log.info('Ensuring all vendored content has read permissions...')
        profile_vendor.make_readable

        # refresh the profile object since the profile now has new files
        create_profile_object
      end
    end

    def validate_habitat_installed
      Habitat::Log.info('Checking to see if Habitat is installed...')
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
      Habitat::Log.debug("Generated work directory #{@work_dir}")

      @work_dir
    end

    def create_habitat_directories(parent_directory)
      [
        File.join(parent_directory, 'habitat'),
        File.join(parent_directory, 'habitat', 'config'),
        File.join(parent_directory, 'habitat', 'hooks'),
      ].each do |dir|
        Dir.mkdir(dir) unless Dir.exist?(dir)
      end
    end

    def copy_profile_to_work_dir
      Habitat::Log.info('Copying profile contents to the work directory...')
      profile.files.each do |f|
        src = File.join(profile.root_path, f)
        dst = File.join(work_dir, f)
        if File.directory?(f)
          Habitat::Log.debug("Creating directory #{dst}")
          FileUtils.mkdir_p(dst)
        else
          Habitat::Log.debug("Copying file #{src} to #{dst}")
          FileUtils.cp_r(src, dst)
        end
      end
    end

    def create_plan(directory)
      plan_file = File.join(directory, 'habitat', 'plan.sh')
      Habitat::Log.info("Generating Habitat plan at #{plan_file}...")
      File.write(plan_file, plan_contents)
    end

    def create_run_hook(directory)
      run_hook_file = File.join(directory, 'habitat', 'hooks', 'run')
      Habitat::Log.info("Generating a Habitat run hook at #{run_hook_file}...")
      File.write(run_hook_file, run_hook_contents)
    end

    def create_settings_file(directory)
      settings_file = File.join(directory, 'habitat', 'config', 'settings.sh')
      Habitat::Log.info("Generating a settings file at #{settings_file}...")
      File.write(settings_file, "SLEEP_TIME={{cfg.sleep_time}}\n")
    end

    def create_default_config(directory)
      default_toml = File.join(directory, 'habitat', 'default.toml')
      Habitat::Log.info("Generating Habitat's default.toml configuration...")
      File.write(default_toml, 'sleep_time = 300')
    end

    def build_hart
      Habitat::Log.info('Building our Habitat artifact...')

      env = {
        'TERM'               => 'vt100',
        'HAB_ORIGIN'         => habitat_origin,
        'HAB_NONINTERACTIVE' => 'true',
      }

      env['RUST_LOG'] = 'debug' if Habitat::Log.level == :debug

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
      Habitat::Log.info('Uploading the Habitat artifact to our Depot...')

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

      Habitat::Log.info('Upload complete!')
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
        Habitat::Log.error(error_msg)
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
        pkg_deps=(chef/inspec core/ruby core/hab)
        pkg_svc_user=root
      EOL

      plan += "pkg_license='#{profile.metadata.params[:license]}'\n\n" if profile.metadata.params[:license]

      plan += <<~EOL

        do_build() {
          cp -vr $PLAN_CONTEXT/../* $HAB_CACHE_SRC_PATH/$pkg_dirname
        }

        do_install() {
          local profile_contents
          local excludes
          profile_contents=($(ls))
          excludes=(habitat results *.hart)

          for item in ${excludes[@]}; do
            profile_contents=(${profile_contents[@]/$item/})
          done

          mkdir ${pkg_prefix}/dist
          cp -r ${profile_contents[@]} ${pkg_prefix}/dist/
        }
      EOL

      plan
    end

    def run_hook_contents
      <<~EOL
        #!/bin/sh

        # redirect stderr to stdout
        # ultimately, we'd like to log this somewhere useful, but due to
        # https://github.com/habitat-sh/habitat/issues/2395, we need to
        # avoid doing that for now.
        exec 2>&1

        # InSpec will try to create a .cache directory in the user's home directory
        # so this needs to be someplace writeable by the hab user
        export HOME={{pkg.svc_var_path}}

        PROFILE_IDENT="{{pkg.origin}}/{{pkg.name}}"
        RESULTS_DIR="{{pkg.svc_var_path}}/inspec_results"
        RESULTS_FILE="${RESULTS_DIR}/{{pkg.name}}.json"

        # Create a directory for inspec formatter output
        mkdir -p {{pkg.svc_var_path}}/inspec_results

        while true; do
          echo "Executing InSpec for ${PROFILE_IDENT}"
          inspec exec {{pkg.path}}/dist --format=json > ${RESULTS_FILE}

          if [ $? -eq 0 ]; then
            echo "InSpec run completed successfully."
          else
            echo "InSpec run did not complete successfully. If you do not see any errors above,"
            echo "control failures were detected. Check the InSpec results here for details:"
            echo ${RESULTS_FILE}
            echo "Otherwise, troubleshoot any errors shown above."
          fi

          source {{pkg.svc_config_path}}/settings.sh
          echo "sleeping for ${SLEEP_TIME} seconds"
          sleep ${SLEEP_TIME}
        done
      EOL
    end
  end
end
