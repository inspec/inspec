require "inspec/resources/command"
require "shellwords" unless defined?(Shellwords)

module Inspec::Resources
  class NpmPackage < Inspec.resource(1)
    name "npm"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the npm InSpec audit resource to test if a global npm package is installed. npm is the the package manager for Nodejs packages, such as bower and StatsD."
    example <<~EXAMPLE
      describe npm('bower') do
        it { should be_installed }
      end

      describe npm('tar', path: '/path/to/project') do
        it { should be_installed }
      end
    EXAMPLE

    def initialize(package_name, opts = {})
      @package_name = package_name
      @location = opts[:path]
      @cache = nil
    end

    def info
      return @info if defined?(@info)

      if @location
        command_separator = inspec.os.platform?("windows") ? ";" : "&&"
        invocation = "cd #{Shellwords.escape @location} #{command_separator} npm"
      else
        invocation = "npm -g"
      end

      invocation = "#{invocation} ls --json #{@package_name}"

      # If on unix, wrap in sh -c to protect against sudo
      unless inspec.os.platform?("windows")
        invocation = "sh -c '#{invocation}'"
      end

      cmd = inspec.command(invocation)
      @info = {
        name: @package_name,
        type: "npm",
        installed: cmd.exit_status == 0,
      }
      return @info unless @info[:installed]

      pkgs = JSON.parse(cmd.stdout)
      @info[:version] = pkgs["dependencies"][@package_name]["version"]
      @info
    end

    def installed?
      info[:installed] == true
    end

    def version
      info[:version]
    end

    def to_s
      "Npm Package #{@package_name}"
    end
  end
end
