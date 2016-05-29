# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
require 'net/http'

module Supermarket
  class SupermarketCLI < Inspec::BaseCLI
    namespace 'supermarket'

    desc 'profiles [URL]', 'list all available profiles in Chef Supermarket'
    def profiles(location = '')
      Supermarket::Helper.parse_host(location)
      # display profiles in format user/profile
      supermarket_profiles = Supermarket::API.profiles
      puts "#{mark_text('supermarket: ')}  #{Supermarket::API.config_key('supermarket_url')}"
      puts
      headline('Available profiles:')
      supermarket_profiles.each { |p|
        li("#{p['tool_owner']}/#{p['slug']}")
      }
    end

    desc 'exec PROFILE', 'execute a Supermarket profile'
    exec_options
    def exec(*tests)
      # iterate over tests and add compliance scheme
      tests = tests.map { |t| (URI(t).scheme != 'supermarket' ? 'supermarket://' + t : t) }

      # execute profile from inspec exec implementation
      diagnose
      run_tests(tests, opts)
    end

    desc 'info PROFILE', 'display Supermarket profile details'
    def info(profile)
      Supermarket::Helper.parse_host(profile)
      # check that the profile is available
      supermarket_profiles = Supermarket::API.profiles
      puts "#{mark_text('supermarket: ')}  #{Supermarket::API.config_key('supermarket_url')}"
      puts
      tool_owner, tool_name = profile.split('/').last(2)
      found = supermarket_profiles.select { |p|
        "#{p['tool_owner']}/#{p['slug']}" == "#{tool_owner}/#{tool_name}"
      }

      if found.empty?
        puts "#{mark_text(profile)} is not available"
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
