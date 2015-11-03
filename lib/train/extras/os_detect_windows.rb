# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
#
# This is heavily based on:
#
#   OHAI https://github.com/chef/ohai
#   by Adam Jacob, Chef Software Inc
#

require 'json'

module Train::Extras
  module DetectWindows
    # See: https://msdn.microsoft.com/en-us/library/windows/desktop/ms724832%28v=vs.85%29.aspx
    # Product Type:
    # Work Station (1)
    # Domain Controller (2)
    # Server (3)
    WINDOWS_VERSIONS = {
      '0' => '3.1',
      '140' => '95',
      '1410' => '98',
      '1490' => 'ME',
      '1351' => 'NT 3.51',
      '3351' => 'NT 3.51 Server',
      '1240' => 'NT 4.0',
      '3240' => 'NT 4.0 Server',
      '1250' => '2000',
      '1251' => 'XP',
      '3252' => 'Server 2003',
      '1252' => 'Vista',
      '3260' => 'Server 2008',
      '1261' => '7',
      '3261' => 'Server 2008 R2',
      '1262' => '8',
      '3262' => 'Server 2012',
      '1263' => '8.1',
      '3263' => 'Server 2012 R2',
      '12100' => '10',
      '32100' => 'Server 2016',
    }

    def windows_version(json)
      producttype = json['OS']['ProductType'].to_s
      # do not distigush between domain controller and server
      producttype = '3' if producttype == '2'
      platform = json['OSVersion']['Platform'].to_s
      major = json['OSVersion']['Version']['Major'].to_s
      minor = json['OSVersion']['Version']['Minor'].to_s
      # construct it
      producttype + platform + major + minor
    end

    def detect_windows
      cmd = 'New-Object -Type PSObject | Add-Member -MemberType NoteProperty '\
            '-Name OS -Value (Get-WmiObject -Class Win32_OperatingSystem) '\
            '-PassThru | Add-Member -MemberType NoteProperty -Name OSVersion '\
            '-Value ([Environment]::OSVersion) -PassThru | ConvertTo-Json'
      res = @backend.run_command(cmd)
      # TODO: error as this shouldnt be happening at this point
      return false if res.exit_status != 0 or res.stdout.empty?

      json = JSON.parse(res.stdout)
      return false if json.nil? or json.empty?
      version = windows_version(json)

      @platform[:family] = 'windows'
      @platform[:release] = WINDOWS_VERSIONS[version]
      true
    end
  end
end
