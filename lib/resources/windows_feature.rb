# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# check for a Windows feature
# Usage:
# describe windows_feature('DHCP Server') do
#   it{ should be_installed }
# end
#
# deprecated serverspec syntax:
# describe windows_feature('IIS-Webserver') do
#   it{ should be_installed.by("dism") }
# end
#
# describe windows_feature('Web-Webserver') do
#   it{ should be_installed.by("powershell") }
# end
#
# This implementation uses the Get-WindowsFeature commandlet:
# Get-WindowsFeature | Where-Object {$_.Name -eq 'XPS Viewer' -or $_.DisplayName -eq 'XPS Viewe
# r'} | Select-Object -Property Name,DisplayName,Description,Installed,InstallState | ConvertTo-Json
# {
#     "Name":  "XPS-Viewer",
#     "DisplayName":  "XPS Viewer",
#     "Description":  "The XPS Viewer is used to read, set permissions for, and digitally sign XPS documents.",
#     "Installed":  false,
#     "InstallState":  0
# }
module Inspec::Resources
  class WindowsFeature < Inspec.resource(1)
    name 'windows_feature'
    desc 'Use the windows_feature InSpec audit resource to test features on Microsoft Windows.'
    example "
      describe windows_feature('dhcp') do
        it { should be_installed }
      end
    "

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

      @cache = {
        name: @feature,
        type: 'windows-feature',
      }

      # cannot rely on exit code for now, successful command returns exit code 1
      # return nil if cmd.exit_status != 0
      # try to parse json
      begin
        params = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return @cache
      end

      @cache = {
        name: params['Name'],
        description: params['Description'],
        installed: params['Installed'],
        type: 'windows-feature',
      }
    end

    def to_s
      "Windows Feature '#{@feature}'"
    end
  end
end
