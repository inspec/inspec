# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# author: Joe Nuspl

module Inspec::Resources
  class GemPackage < Inspec.resource(1)
    name 'gem'
    desc 'Use the gem InSpec audit resource to test if a global gem package is installed.'
    example "
      describe gem('rubocop') do
        it { should be_installed }
        its('version') { should eq '0.33.0' }
      end
    "

    attr_reader :gem_binary

    def initialize(package_name, gem_binary = nil)
      @package_name = package_name
      @gem_binary = gem_binary || 'gem'
    end

    def info
      return @info if defined?(@info)

      cmd = inspec.command("#{@gem_binary} list --local -a -q \^#{@package_name}\$")
      @info = {
        installed: cmd.exit_status.zero?,
        type: 'gem',
      }
      return @info unless @info[:installed]

      # extract package name and version
      # parses data like winrm (1.3.4, 1.3.3)
      params = /^\s*([^\(]*?)\s*\((.*?)\)\s*$/.match(cmd.stdout.chomp)
      versions = params[2].split(',')
      @info[:name] = params[1]
      @info[:version] = versions[0]
      @info
    end

    def installed?
      info[:installed] == true
    end

    def version
      info[:version]
    end

    def to_s
      "gem package #{@package_name}"
    end
  end

  class ChefGemPackage < GemPackage
    name 'chef_gem'
    desc 'Use the chef_gem InSpec audit resource to test if a gem is installed in the chef omnibus.'
    example "
      describe chef_gem('chef-sugar') do
        it { should be_installed }
        its('version') { should eq '3.4.0' }
      end
    "

    def initialize(package_name)
      gem_binary = if inspec.os.windows?
                     'c:\opscode\chef\embedded\bin\gem'
                   else
                     '/opt/chef/embedded/bin/gem'
                   end
      super(package_name, gem_binary)
    end

    def to_s
      "chef_gem #{@package_name}"
    end
  end

  class ChefServerGemPackage < GemPackage
    name 'chef_server_gem'
    desc 'Use the chef_server_gem InSpec audit resource to test if a gem is installed in the chef-server omnibus.'
    example "
      describe chef_server_gem('knife-backup') do
        it { should be_installed }
        its('version') { should eq '0.0.12' }
      end
    "

    def initialize(package_name)
      gem_binary = '/opt/opscode/embedded/bin/gem'
      super(package_name, gem_binary)
    end

    def to_s
      "chef_server_gem #{@package_name}"
    end
  end
end
