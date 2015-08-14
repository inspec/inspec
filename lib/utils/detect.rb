# encoding: utf-8
#
# Copyright 2015, Vulcano Security GmbH
#
# Tiny test file to return OS info of the tested node

require 'json'

if os[:family] == 'windows'
  res = JSON.parse(command('New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name OS -Value (Get-WmiObject -Class Win32_OperatingSystem) -PassThru | Add-Member -MemberType NoteProperty -Name OSVersion -Value ([Environment]::OSVersion) -PassThru | ConvertTo-Json').stdout)
  release = res["OS"]["Caption"]
end

# hijack os-detection from serverspec
puts JSON.dump({
  os_family:   os[:family],
  os_release:  release || os[:release],
  os_arch:     os[:arch]
})
exit 0
