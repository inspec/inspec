# encoding: utf-8

module Inspec::Resources
  class WindowsFeature < Inspec.resource(1)
    name 'windows_feature'
    supports platform: 'windows'
    desc 'Use the windows_feature InSpec audit resource to test features on Microsoft Windows.'
    example <<-EOX
      # By default this resource will use Get-WindowsFeature.
      # Failing that, it will use DISM.

      # Get-WindowsFeature Example
      describe windows_feature('Web-WebServer') do
        it { should be_installed }
      end

      # DISM Example
      describe windows_feature('IIS-WebServer') do
        it { should be_installed }
      end
    EOX

    def initialize(feature)
      @feature = feature
      @cache = nil

      # verify that this resource is only supported on Windows
      return skip_resource 'The `windows_feature` resource is not supported on your OS.' if !inspec.os.windows?
    end

    # returns true if the package is installed
    def installed?(_provider = nil, _version = nil)
      info[:installed] == true
    end

    # returns the package description
    def info
      return @cache if !@cache.nil?
      features_cmd = "Get-WindowsFeature | Where-Object {$_.Name -eq '#{@feature}' -or $_.DisplayName -eq '#{@feature}'} | Select-Object -Property Name,DisplayName,Description,Installed,InstallState | ConvertTo-Json"
      cmd = inspec.command(features_cmd)

      # The `Get-WindowsFeature` command is not available on the Windows
      # non-server OS. This attempts to use the `dism` command to get the info.
      if cmd.stderr =~ /The term 'Get-WindowsFeature' is not recognized/
        params = info_via_dism(@feature)
      else
        # We cannot rely on `cmd.exit_status != 0` because by default the
        # command will exit 1 even on success. So, if we cannot parse the JSON
        # we know that the feature is not installed.
        begin
          params = JSON.parse(cmd.stdout)
          params['type'] = 'windows-feature'
        rescue JSON::ParserError => _e
          @cache = {
            name: @feature,
            type: 'windows-feature',
          }
          return @cache
        end
      end

      @cache = {
        name: params['Name'],
        description: params['Description'],
        installed: params['Installed'],
        type: params['type'],
      }
    end

    def to_s
      "Windows Feature '#{@feature}'"
    end

    private

    def info_via_dism(feature_name)
      dism_command = "dism /online /get-featureinfo /featurename:#{@feature}"
      cmd = inspec.command(dism_command)

      if cmd.exit_status != 0
        info = {
          'Name' => feature_name,
          'Description' => 'N/A',
          'Installed' => false,
        }
      else
        result = cmd.stdout
        info = {
          'Name' => result.match(/Feature Name : (.*)(\r\n|\n)/).captures[0],
          'Description' => result.match(/Description : (.*)(\r\n|\n)/).captures[0],
          'Installed' => true,
        }
      end

      info['type'] = 'dism'
      info
    end
  end
end
