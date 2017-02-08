# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module Supermarket
  class SupermarketCLI < Inspec::BaseCLI
    namespace 'supermarket'

    # TODO: find another solution, once https://github.com/erikhuda/thor/issues/261 is fixed
    def self.banner(command, _namespace = nil, _subcommand = false)
      "#{basename} #{subcommand_prefix} #{command.usage}"
    end

    def self.subcommand_prefix
      namespace
    end

    desc 'profiles', 'list all available profiles in Chef Supermarket'
    def profiles
      # display profiles in format user/profile
      supermarket_profiles = Supermarket::API.profiles

      headline('Available profiles:')
      supermarket_profiles.each { |p|
        li("#{p['tool_name']} #{mark_text(p['tool_owner'] + '/' + p['slug'])}")
      }
    end

    desc 'exec PROFILE', 'execute a Supermarket profile'
    exec_options
    def exec(*tests)
      # iterate over tests and add compliance scheme
      tests = tests.map { |t| 'supermarket://' + t }

      # execute profile from inspec exec implementation
      diagnose
      run_tests(tests, opts)
    end

    desc 'info PROFILE', 'display Supermarket profile details'
    def info(profile)
      # check that the profile is available
      supermarket_profiles = Supermarket::API.profiles
      found = supermarket_profiles.select { |p|
        "#{p['tool_owner']}/#{p['slug']}" == profile
      }

      if found.empty?
        puts "#{mark_text(profile)} is not available on Supermarket"
        return
      end

      # load details for the specific profile
      info = Supermarket::API.info(profile)
      puts "#{mark_text('name: ')}  #{info['slug']}"
      puts "#{mark_text('owner:')}  #{info['owner']}"
      puts "#{mark_text('url:  ')}  #{info['source_url']}"
      puts
      puts "#{mark_text('description:  ')} #{info['description']}"
    end
  end

  # register the subcommand to Inspec CLI registry
  Inspec::Plugins::CLI.add_subcommand(SupermarketCLI, 'supermarket', 'supermarket SUBCOMMAND ...', 'Supermarket commands', {})
end
