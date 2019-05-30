require 'inspec/resources/command'

module Inspec::Resources
  class WindowsFeature < Inspec.resource(1)
    name 'windows_feature'
    supports platform: 'windows'
    desc 'Use the windows_feature InSpec audit resource to test features on Microsoft Windows.'
    example <<~EXAMPLE
      # By default this resource will use Get-WindowsFeature.
      # Failing that, it will use DISM.

      # Get-WindowsFeature Example
      describe windows_feature('Web-WebServer', :powershell) do
        it { should be_installed }
      end

      # DISM Example
      describe windows_feature('IIS-WebServer', :dism) do
        it { should be_installed }
      end

      # Try PowerShell then DISM Example
      describe windows_feature('IIS-WebServer') do
        it { should be_installed }
      end
    EXAMPLE

    def initialize(feature, method = nil)
      @feature = feature
      @method = method
      @cache = nil
    end

    # returns true if the package is installed
    def installed?
      info[:installed] == true
    end

    # returns the package description
    def info
      return @cache if !@cache.nil?

      case @method
      when :powershell
        @cache = info_via_powershell(@feature)
        if @cache[:error]
          # TODO: Allow handling `Inspec::Exception` outside of initialize
          # See: https://github.com/inspec/inspec/issues/3237
          # The below will fail the resource regardless of what is raised
          raise Inspec::Exceptions::ResourceFailed, @cache[:error]
        end
      when :dism
        @cache = info_via_dism(@feature)
      else
        @cache = info_via_powershell(@feature)
        @cache = info_via_dism(@feature) if @cache[:error]
      end

      @cache
    end

    def to_s
      "Windows Feature '#{@feature}'"
    end

    private

    def info_via_dism(feature)
      dism_command = "dism /online /get-featureinfo /featurename:#{feature}"
      cmd = inspec.command(dism_command)

      if cmd.exit_status != 0
        feature_info = {
          name: feature,
          description: 'N/A',
          installed: false,
        }
      else
        result = cmd.stdout
        feature_name_regex = /Feature Name : (.*)(\r\n|\n)/
        description_regex = /Description : (.*)(\r\n|\n)/
        feature_info = {
          name: result.match(feature_name_regex).captures[0].chomp,
          description: result.match(description_regex).captures[0].chomp,
          installed: true,
        }
      end

      feature_info[:method] = :dism
      feature_info
    end

    def info_via_powershell(feature)
      features_cmd = "Get-WindowsFeature | Where-Object {$_.Name -eq '#{feature}' -or $_.DisplayName -eq '#{feature}'} | Select-Object -Property Name,DisplayName,Description,Installed,InstallState | ConvertTo-Json"
      cmd = inspec.command(features_cmd)

      feature_info = {}

      # The `Get-WindowsFeature` command is not available on the Windows
      # non-server OS. This attempts to use the `dism` command to get the info.
      if cmd.stderr =~ /The term 'Get-WindowsFeature' is not recognized/
        feature_info[:name] = feature
        feature_info[:error] = 'Could not find `Get-WindowsFeature`'
      else
        # We cannot rely on `cmd.exit_status != 0` because by default the
        # command will exit 1 even on success. So, if we cannot parse the JSON
        # we know that the feature is not installed.
        begin
          result = JSON.parse(cmd.stdout)

          feature_info = {
            name: result['Name'],
            description: result['Description'],
            installed: result['Installed'],
          }
        rescue JSON::ParserError => _e
          feature_info[:name] = feature
          feature_info[:installed] = false
        end
      end

      feature_info[:method] = :powershell
      feature_info
    end
  end
end
