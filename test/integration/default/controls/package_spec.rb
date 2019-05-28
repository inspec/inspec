case os[:family]
when 'centos', 'fedora', 'opensuse', 'debian', 'ubuntu'
  describe package('curl') do
    it { should be_installed }
  end
when 'aix'
  describe package('bos.rte') do
    it { should be_installed }
    its('version') { should match /^(6|7)[.|\d]+\d$/ }
  end
when 'solaris'
  if os[:release] == '11'
    pkg = 'system/file-system/zfs'
    ver = /^0\.5.+$/
  else
    pkg = 'SUNWzfsr'
    ver = /^11\.10.+$/
  end

  describe package(pkg) do
    it { should be_installed }
    its('version') { should match ver }
  end
end

describe package('nginx') do
  it { should_not be_installed }
end

# the following test will iterate over all packages retrieved via WMI and verifies that the
# optimized package implementation is returning the same results
if os.windows?
  # compare optimized version with wmi results
  packages = powershell("Get-WmiObject -Class Win32_Product |  % { $_.Name }").stdout.strip.split("\n")

  packages.each { |pkg|
    package_name = pkg.strip
    # get wmi package information
    cmd = powershell("Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq '#{package_name}'} | Select-Object -Property Name,Version,Vendor,PackageCode,Caption,Description | ConvertTo-Json")
    wmi_package = JSON.parse(cmd.stdout)
    wmi_info = {
      name: wmi_package['Name'],
      installed: true,
      version: wmi_package['Version'],
      type: 'windows',
    }

    # get registry package information
    info = package(package_name).info

    # compare results
    describe wmi_info do
      it { should eq info}
    end
  }
end
