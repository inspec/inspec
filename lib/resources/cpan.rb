# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe cpan('DBD::Pg') do
#   it { should be_installed }
# end
#

module Inspec::Resources
  class CpanPackage < Inspec.resource(1)
    name 'cpan'
    desc 'Use the cpan InSpec audit resource to test Perl modules that are installed using the cpan installer.'
    example "
      describe cpan('DBD::Pg') do
        it { should be_installed }
      end
    "

    def initialize(package_name, cpan_path = nil)
      @package_name = package_name
      @cpan_cmd = cpan_path || 'cpan'
      # this resource is not supported on Windows
      skip_resource 'The `cpan` resource is not supported on your OS yet.' if inspec.os.windows?
      return skip_resource 'cpan not found' unless inspec.command(@cpan_cmd).exist?
    end

    def info
      return @info if defined?(@info)

      @info = {}
      @info[:type] = 'cpan'
      cmd = inspec.command("perl -le 'eval \"require $ARGV[0]\" and print $ARGV[0]->VERSION or exit 1' #{@package_name}")
      return @info if cmd.exit_status != 0

      @info[:name] = @package_name
      @info[:version] = cmd.stdout.strip
      @info[:installed] = true
      @info
    end

    def installed?
      info[:installed] == true
    end

    def version
      info[:version]
    end

    def to_s
      "Perl Module #{@package_name}"
    end

  end
end
