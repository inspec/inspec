# frozen_string_literal: true

require 'inspec/resources/command'
require 'inspec/resources/powershell'

# Check for Chocolatey packages to be installed
module Inspec::Resources
  class ChocoPkg < Inspec.resource(1)
    name 'chocolatey_package'
    supports platform: 'windows'
    desc 'Use the chocolatey_package InSpec audit resource to test if the named package and/or package version is installed on the system.'
    example <<~EXAMPLE
      describe chocolatey_package('git') do
        it { should be_installed }
        its('version') { should eq '2.15.1' }
      end
    EXAMPLE

    attr_reader :package_name

    def initialize(package_name, _opts = {})
      raise 'Chocolatey is not installed' unless inspec.command('choco').exist?
      @package_name = package_name
      @cache = base_data.update(generate_cache)
    end

    def installed?
      @cache[:installed]
    end

    def info
      @cache.dup
    end

    def respond_to_missing?(method_name, *)
      @cache.key?(method_name) || super
    end

    def method_missing(method_name, *args, &block)
      if @cache.key?(method_name)
        @cache.fetch(method_name)
      else
        super
      end
    end

    def to_s
      "Chocolatey package #{package_name}"
    end

    private

    def base_data
      {
        name: package_name,
        version: nil,
        installed: false,
        type: 'chocolatey',
      }
    end

    def generate_cache
      command = <<-EOH
      (choco list --local-only --exact --include-programs --limit-output '#{package_name.gsub("'", "\`'")}') -Replace "\\|", "=" | ConvertFrom-StringData | ConvertTo-JSON
      EOH

      cmd = inspec.powershell(command.strip)

      return {} if cmd.exit_status != 0 || cmd.stdout.strip.empty?
      out = JSON.parse(cmd.stdout)

      return {
        version: out.fetch(package_name),
        installed: true,
      }
    rescue JSON::ParserError, KeyError
      return {}
    end
  end
end
