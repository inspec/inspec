require 'inspec/resources/command'

module Inspec::Resources
  class GemPackage < Inspec.resource(1)
    name 'gem'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the gem InSpec audit resource to test if a global gem package is installed.'
    example <<~EXAMPLE
      describe gem('rubocop') do
        it { should be_installed }
        its('version') { should eq '0.33.0' }
      end
    EXAMPLE

    attr_reader :gem_binary

    def initialize(package_name, gem_binary = nil)
      @package_name = package_name
      @gem_binary = case gem_binary
                    when nil
                      'gem'
                    when :chef
                      if inspec.os.windows?
                        'c:\opscode\chef\embedded\bin\gem.bat'
                      else
                        '/opt/chef/embedded/bin/gem'
                      end
                    when :chef_server
                      '/opt/opscode/embedded/bin/gem'
                    else
                      gem_binary
                    end
      skip_resource 'Unable to retrieve gem information' if info.empty?
    end

    def info
      return @info if defined?(@info)

      cmd = inspec.command("#{@gem_binary} list --local -a -q \^#{@package_name}\$")
      return {} unless cmd.exit_status.zero?

      # extract package name and version
      # parses data like winrm (1.3.4, 1.3.3)
      params = /^\s*([^\(]*?)\s*\((.*?)\)\s*$/.match(cmd.stdout.chomp)
      @info = {
        installed: !params.nil?,
        type: 'gem',
      }
      return @info unless @info[:installed]

      versions = params[2].split(',').map(&:strip)
      @info[:name] = params[1]
      @info[:version] = versions[0]
      @info[:versions] = versions
      @info
    end

    def installed?
      info[:installed] == true
    end

    def version
      info[:version]
    end

    # this returns an array of strings
    def versions
      info[:versions]
    end

    def to_s
      "gem package #{@package_name}"
    end
  end
end
