# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'thor'
require 'erb'

module Compliance
  class ComplianceCLI < Inspec::BaseCLI # rubocop:disable Metrics/ClassLength
    namespace 'compliance'

    desc 'login SERVER', 'Log in to a Chef Compliance SERVER'
    option :server, type: :string, desc: 'Chef Compliance Server URL'
    option :insecure, aliases: :k, type: :boolean,
      desc: 'Explicitly allows InSpec to perform "insecure" SSL connections and transfers'
    option :user, type: :string, required: false,
      desc: 'Chef Compliance Username (for legacy auth)'
    option :password, type: :string, required: false,
      desc: 'Chef Compliance Password (for legacy auth)'
    option :apipath, type: :string, default: '/api',
      desc: 'Set the path to the API, defaults to /api'
    option :token, type: :string, required: false,
      desc: 'Chef Compliance access token'
    option :refresh_token, type: :string, required: false,
      desc: 'Chef Compliance refresh token'
    def login(server)
      # if Compliance::Configuration.new.supported?(:oidc)
      #   puts "Your server is support --token and --refresh_token"
      # else
      #   puts "Your server is outdated and supports only combination of --user and --password"
      # end
      options['server'] = server
      url = options['server'] + options['apipath']

      if !options['user'].nil? && !options['password'].nil?
        # username / password
        success, msg = Compliance::API.legacy_login(url, options['user'], options['password'], options['insecure'])
      elsif !options['token'].nil?
        # access token
        success, msg = Compliance::API.access_token(url, options['token'], options['insecure'])
      elsif !options['refresh_token'].nil? && !options['user'].nil?
        # refresh token
        success, msg = Compliance::API.refresh_token(url, options['token'], true, options['user'], options['insecure'])
      else
        # try stored refresh_token
        success, msg = Compliance::API.login(options['insecure'])
      end

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
      success, msg = Compliance::API.post_file(url, config['token'], archive_path, config['insecure'])
      if success
        puts 'Successfully uploaded profile'
      else
        puts 'Error during profile upload:'
        puts msg
      end
    end

    desc 'version', 'displays the version of the Chef Compliance server'
    def version
      config = Compliance::Configuration.new
      info = Compliance::API.version(config['server'], config['insecure'])
      if !info.nil? && info['version']
        puts "Chef Compliance version: #{info['version']}"
      else
        puts 'Could not determine server version.'
      end
    end

    desc 'logout', 'user logout from Chef Compliance'
    def logout
      if Compliance::Configuration.new.supported?(:oidc)
        success = Compliance::API.logout
      else
        success = Compliance::API.legacy_logout
      end

      if success
        puts 'Successfully logged out'
      else
        puts 'Could not log out'
      end
    end
  end

  # register the subcommand to Inspec CLI registry
  Inspec::Plugins::CLI.add_subcommand(ComplianceCLI, 'compliance', 'compliance SUBCOMMAND ...', 'Chef Compliance commands', {})
end
