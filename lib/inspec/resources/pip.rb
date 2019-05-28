# Usage:
# describe pip('Jinja2') do
#   it { should be_installed }
# end
#

module Inspec::Resources
  class PipPackage < Inspec.resource(1)
    name 'pip'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the pip InSpec audit resource to test packages that are installed using the pip installer.'
    example <<~EXAMPLE
      describe pip('Jinja2') do
        it { should be_installed }
      end

      describe pip('django', '/path/to/virtualenv/bin/pip') do
        it { should be_installed }
        its('version') { should eq('1.11.4')}
      end
    EXAMPLE

    def initialize(package_name, pip_path = nil)
      @package_name = package_name
      @pip_cmd = pip_path || default_pip_path

      return skip_resource 'pip not found' if @pip_cmd.nil?
    end

    def info
      return @info if defined?(@info)

      @info = {}
      @info[:type] = 'pip'
      return @info unless cmd_successful?

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

    def cmd
      @__cmd ||= inspec.command("#{@pip_cmd} show #{@package_name}")
    end

    def cmd_successful?
      return true if cmd.exit_status == 0

      if cmd.exit_status != 0
        # If pip on windows is not the latest, it will create a stderr value along with stdout
        # Example:
        #   stdout: "Name: Jinja2\r\nVersion: 2.10..."
        #   stderr: "You are using pip version 9.0.1, however version 9.0.3 is available..."
        if inspec.os.windows? && !cmd.stdout.empty?
          return true
        end
      end

      false
    end

    # Paths of Python and Pip on windows
    # {"Pip" => nil, "Python" => "/path/to/python"}
    #
    # @return [Hash] of windows_paths
    def windows_paths
      return @__windows_paths if @__windows_paths
      cmd = inspec.command(
        'New-Object -Type PSObject |
         Add-Member -MemberType NoteProperty -Name Pip -Value (Invoke-Command -ScriptBlock {where.exe pip}) -PassThru |
         Add-Member -MemberType NoteProperty -Name Python -Value (Invoke-Command -ScriptBlock {where.exe python}) -PassThru |
         ConvertTo-Json',
      )

      @__windows_paths = JSON.parse(cmd.stdout)
    end

    # Default path of python pip installation
    #
    # @return [String] of python pip path
    def default_pip_path
      return 'pip' unless inspec.os.windows?

      # If python is not found, return with skip_resource
      return skip_resource 'python not found' if windows_paths['Python'].nil?

      # Pip is not on the default path for Windows, therefore we do some logic
      # to find the binary on Windows
      begin
        # use pip if it on system path
        pipcmd = windows_paths['Pip']
        # calculate path on windows
        if defined?(windows_paths['Python']) && pipcmd.nil?
          return nil if windows_paths['Pip'].nil?
          pipdir = windows_paths['Python'].split('\\')
          # remove python.exe
          pipdir.pop
          pipcmd = pipdir.push('Scripts').push('pip.exe').join('/')
        end
      rescue JSON::ParserError => _e
        return nil
      end

      pipcmd
    end
  end
end
