# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'thor'
require 'erb'

module Compliance
  class ComplianceCLI < Inspec::BaseCLI # rubocop:disable Metrics/ClassLength
    namespace 'compliance'

    desc 'login SERVER', 'Log in to a Chef Compliance SERVER'
    option :user, type: :string, required: true,
      desc: 'Chef Compliance Username'
    option :password, type: :string, required: true,
      desc: 'Chef Compliance Password'
    option :insecure, aliases: :k, type: :boolean,
      desc: 'Explicitly allows InSpec to perform "insecure" SSL connections and transfers'
    def login(server)
      success, msg = Compliance::API.login(server, options['user'], options['password'], options['insecure'])
      if success
        puts 'Successfully authenticated'
      else
        puts msg
      end
    end

    desc 'profiles', 'list all available profiles in Chef Compliance'
    def profiles
      profiles = Compliance::API.profiles
      if !profiles.empty?
        # iterate over profiles
        headline('Available profiles:')
        profiles.each { |profile|
          li("#{profile[:org]}/#{profile[:name]}")
        }
      else
        puts 'Could not find any profiles'
      end
    end

    desc 'exec PROFILE', 'executes a Chef Compliance profile'
    exec_options
    def exec(*tests)
      # iterate over tests and add compliance scheme
      tests = tests.map { |t| 'compliance://' + t }

      # execute profile from inspec exec implementation
      diagnose
      run_tests(tests, opts)
    end

    desc 'upload PATH', 'uploads a local profile to Chef Compliance'
    option :overwrite, type: :boolean, default: false,
      desc: 'Overwrite existing profile on Chef Compliance.'
    def upload(path) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, PerceivedComplexity
      o = options.dup
      configure_logger(o)
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
      config = Compliance::Configuration.new
      if config['token'].nil? || config['user'].nil?
        error.call('Please login via `inspec compliance login`')
      end

      # owner
      owner = config['user']
      # read profile name from inspec.yml
      profile_name = profile.params[:name]

      # check that the profile is not uploaded already,
      # confirm upload to the user (overwrite with --force)
      if Compliance::API.exist?("#{owner}/#{profile_name}") && !options['overwrite']
        error.call('Profile exists on the server, use --overwrite')
      end

      # abort if we found an error
      if error_count > 0
        puts "Found #{error_count} error(s)"
        exit 1
      end

      # if it is a directory, tar it to tmp directory
      if File.directory?(path)
        archive_path = Dir::Tmpname.create([profile_name, '.tar.gz']) {}
        # archive_path = file.path
        puts "Generate temporary profile archive at #{archive_path}"
        profile.archive({ output: archive_path, ignore_errors: false, overwrite: true })
      else
        archive_path = path
      end

      puts "Start upload to #{owner}/#{profile_name}"
      pname = ERB::Util.url_encode(profile_name)

      # upload the tar to Chef Compliance
      url = "#{config['server']}/owners/#{owner}/compliance/#{pname}/tar"

      puts "Uploading to #{url}"
      success, msg = Compliance::API.post_file(url, config['token'], '', archive_path, config['insecure'])
      if success
        puts 'Successfully uploaded profile'
      else
        puts 'Error during profile upload:'
        puts msg
      end
    end

    desc 'version', 'displays the version of the Chef Compliance server'
    def version
      info = Compliance::API.version
      if !info.nil? && info['version']
        puts "Chef Compliance version: #{info['version']}"
      else
        puts 'Could not determine server version.'
      end
    end

    desc 'logout', 'user logout from Chef Compliance'
    def logout
      if Compliance::API.logout
        puts 'Successfully logged out'
      else
        puts 'Could not log out'
      end
    end
  end

  # register the subcommand to Inspec CLI registry
  Inspec::Plugins::CLI.add_subcommand(ComplianceCLI, 'compliance', 'compliance SUBCOMMAND ...', 'Chef Compliance commands', {})
end
