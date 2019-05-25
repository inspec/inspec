require 'inspec/resources/command'

# Usage:
# describe cran('DBI') do
#   it { should be_installed }
# end
#

module Inspec::Resources
  class CranPackage < Inspec.resource(1)
    name 'cran'
    supports platform: 'unix'
    desc 'Use the `cran` InSpec audit resource to test R modules that are installed from CRAN package repository.'
    example <<~EXAMPLE
      describe cran('DBI') do
        it { should be_installed }
      end
    EXAMPLE

    def initialize(package_name)
      @package_name = package_name
      @r_cmd = 'Rscript'

      # this resource is not supported on Windows
      return skip_resource 'The `cran` resource is not supported on your OS yet.' if inspec.os.windows?
      return skip_resource 'Rscript not found' unless inspec.command(@r_cmd).exist?
    end

    def info
      return @info if defined?(@info)

      @info = {}
      @info[:type] = 'cran'
      @info[:name] = @package_name
      cmd = inspec.command("#{@r_cmd} -e 'packageVersion(\"#{@package_name}\")'")
      return @info unless cmd.exit_status.zero?

      # Extract package version from Rscript output
      # Output includes unicode punctuation (backticks) characters like so:
      # [1] '0.5.1'
      #
      # So make sure command output is converted to unicode, as it returns ASCII-8BIT by default
      utf8_stdout = cmd.stdout.chomp.force_encoding(Encoding::UTF_8)
      params = /^\[\d+\]\s+(?:['\p{Initial_Punctuation}])(.+)(?:['\p{Final_Punctuation}])$/.match(utf8_stdout)
      @info[:installed] = !params.nil?
      return @info unless @info[:installed]

      @info[:version] = params[1]
      @info
    end

    def installed?
      info[:installed] == true
    end

    def version
      info[:version]
    end

    def to_s
      "R Module #{@package_name}"
    end
  end
end
