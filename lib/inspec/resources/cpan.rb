require 'inspec/resources/command'

# Usage:
# describe cpan('DBD::Pg') do
#   it { should be_installed }
# end
#

module Inspec::Resources
  class CpanPackage < Inspec.resource(1)
    name 'cpan'
    supports platform: 'unix'
    desc 'Use the `cpan` InSpec audit resource to test Perl modules that are installed by system packages or the CPAN installer.'
    example <<~EXAMPLE
      describe cpan('DBD::Pg') do
        it { should be_installed }
      end
    EXAMPLE

    def initialize(package_name, perl_lib_path = nil)
      @package_name = package_name
      @perl_lib_path = perl_lib_path
      @perl_cmd = 'perl'

      # this resource is not supported on Windows
      return skip_resource 'The `cpan` resource is not supported on your OS yet.' if inspec.os.windows?
      return skip_resource 'perl not found' unless inspec.command(@perl_cmd).exist?
    end

    def info
      return @info if defined?(@info)

      @info = {}
      @info[:type] = 'cpan'
      @info[:name] = @package_name
      # set PERL5LIB environment variable if a custom lib path is given
      lib_path = @perl_lib_path.nil? ? '' : "PERL5LIB=#{@perl_lib_path} "
      cmd = inspec.command("#{lib_path+@perl_cmd} -le 'eval \"require $ARGV[0]\" and print $ARGV[0]->VERSION or exit 1' #{@package_name}")
      @info[:installed] = cmd.exit_status.zero?
      return @info unless cmd.exit_status.zero?

      @info[:version] = cmd.stdout.strip
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
