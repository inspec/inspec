# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'thor'

module Compliance
  class ComplianceCLI < Inspec::BaseCLI
    namespace 'compliance'

    desc 'login SERVER', 'Log in to a Chef Compliance SERVER'
    option :user, type: :string, required: true,
      desc: 'Chef Compliance Username'
    option :password, type: :string, required: true,
      desc: 'Chef Compliance Password'
    def login(server)
      success, msg = Compliance::API.login(server, options['user'], options['password'])
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
        puts 'Available profiles: '
        profiles.each { |profile|
          puts " * #{profile[:org]}/#{profile[:name]}"
        }
      else
        puts 'Could not find any profiles'
      end
    end

    desc 'exec PROFILE', 'executes a Chef Compliance profile'
    option :id, type: :string,
      desc: 'Attach a profile ID to all test results'
    target_options
    option :format, type: :string
    def exec(*tests)
      # iterate over tests and add compliance scheme
      tests = tests.map { |t| 'compliance://' + t }

      # execute profile from inspec exec implementation
      diagnose
      run_tests(opts, tests)
    end

    desc 'upload PATH', 'uploads a local profile to Chef Compliance'
    def upload(_path)
      config = Compliance::Configuration.new
      tar_path = File.join(Dir.pwd, 'profile.tar.gz')

      # read from login
      owner = 'admin'
      profile = 'profile'
      url = "#{config['server']}/owners/#{owner}/compliance/#{profile}/tar"

      puts "Uploading to #{url}"
      if Compliance::API.post_file(url, config['token'], '', tar_path)
        puts 'Successfully uploaded profile'
      else
        puts 'Error during profile upload'
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

  # register the subcommand to InspecCLI
  Inspec::InspecCLI.register(ComplianceCLI, 'compliance', 'compliance SUBCOMMAND ...', 'Chef Compliance commands', {})
end
