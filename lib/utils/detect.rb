# encoding: utf-8
#
# Copyright 2015, Vulcano Security GmbH
#
# Tiny test file to return OS info of the tested node

require 'json'

if os[:family] == 'windows'
  res = JSON.parse(command('New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name OS -Value (Get-WmiObject -Class Win32_OperatingSystem) -PassThru | Add-Member -MemberType NoteProperty -Name OSVersion -Value ([Environment]::OSVersion) -PassThru | ConvertTo-Json').stdout)

  # Product Type:
  # Work Station (1)
  # Domain Controller (2)
  # Server (3)

  # Version = product type + platform + major = minor
  versions = {
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
    '3260' => 'Server 2003 R2',
    '1252' => 'Vista',
    '3252' => 'Server 2008',
    '1261' => '7',
    '3261' => 'Server 2008 R2',
    '1262' => '8',
    '3262' => 'Server 2012',
    '1263' => '8.1',
    '3263' => 'Server 2012 R2',
    '12100' => '10',
    '32100' => 'Server 2016',
  }

  producttype = res['OS']['ProductType'].to_s
  if producttype == '2' then producttype = '3' end
  version = producttype + res['OSVersion']['Platform'].to_s + res['OSVersion']['Version']['Major'].to_s + res['OSVersion']['Version']['Minor'].to_s
  release = versions[version]
end

# print OS detection infos
conf = {
  os_family: os[:family],
  os_release: release || os[:release],
  os_arch: os[:arch],
}
puts JSON.dump(conf)
exit 0
