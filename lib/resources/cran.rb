# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe cran('DBI') do
#   it { should be_installed }
# end
#

module Inspec::Resources
  class CranPackage < Inspec.resource(1)
    name 'cran'
    desc 'Use the `cran` InSpec audit resource to test R modules that are installed from CRAN package repository.'
    example "
      describe cran('DBI') do
        it { should be_installed }
      end
    "

    def initialize(package_name, perl_lib_path = nil)
      @package_name = package_name
      @r_cmd = 'Rscript'

      # this resource is not supported on Windows
      skip_resource 'The `cran` resource is not supported on your OS yet.' if inspec.os.windows?
      return skip_resource 'Rscript not found' unless inspec.command(@r_cmd).exist?
    end

    def info
      return @info if defined?(@info)

      @info = {}
      cmd = inspec.command("#{@r_cmd} -e 'packageVersion(\"#{@package_name}\")'")
      return @info if cmd.exit_status != 0

      # extract package version
      # could be multiline output data like:
      # [1] '0.4.2'
      # [2] '0.4.0'

      # this captures any version:
      # versions = s.scan(/\[\d+\]\s+(?:["'])(.+)(?:["'])/)
      # versions.each {|v|
      #   puts ">>> #{v}"
      # }

      # ... but just capture the first match for the moment
      params = /^\[\d+\]\s+(?:["'])(.+)(?:["'])$/.match(cmd.stdout.chomp)
      @info = {
          installed: !params.nil?,
          type: 'cran',
      }
      return @info unless @info[:installed]

      @info[:name] = @package_name
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
