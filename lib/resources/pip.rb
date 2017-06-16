# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe pip('Jinja2') do
#   it { should be_installed }
# end
#
module Inspec::Resources
  class PipPackage < Inspec.resource(1)
    name 'pip'
    desc 'Use the pip InSpec audit resource to test packages that are installed using the pip installer.'
    example "
      describe pip('Jinja2') do
        it { should be_installed }
      end
    "

    def initialize(package_name)
      @package_name = package_name
    end

    def info
      return @info if defined?(@info)

      @info = {}
      @info[:type] = 'pip'
      cmd = inspec.command("#{pip_cmd} show #{@package_name}")
      return @info if cmd.exit_status != 0

      params = SimpleConfig.new(
        cmd.stdout,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: false,
      ).params
      @info[:name] = params['Name']
      @info[:version] = params['Version']
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
      "Pip Package #{@package_name}"
    end

    private

    def pip_cmd
      # Pip is not on the default path for Windows, therefore we do some logic
      # to find the binary on Windows
      if inspec.os.windows?
        # we need to detect the pip command on Windows
        cmd = inspec.command('New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Pip -Value (Invoke-Command -ScriptBlock {where.exe pip}) -PassThru | Add-Member -MemberType NoteProperty -Name Python -Value (Invoke-Command -ScriptBlock {where.exe python}) -PassThru | ConvertTo-Json')
        begin
          paths = JSON.parse(cmd.stdout)
          # use pip if it on system path
          pipcmd = paths['Pip']
          # calculate path on windows
          if defined?(paths['Python']) && pipcmd.nil?
            pipdir = paths['Python'].split('\\')
            # remove python.exe
            pipdir.pop
            pipcmd = pipdir.push('Scripts').push('pip.exe').join('/')
          end
        rescue JSON::ParserError => _e
          return nil
        end
      end
      pipcmd || 'pip'
    end
  end
end
