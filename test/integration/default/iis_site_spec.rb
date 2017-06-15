# encoding: utf-8

return unless os.windows?

# iis service is running
describe service('W3SVC') do
  it { should be_installed }
  it { should be_running }
end

# test the site without the iis resource
describe powershell("Get-Website") do
  its(:stdout) {should match '.*?Default Web Site.*?'}
end

# test the site with the resource
describe iis_site('Default Web Site') do
  it { should exist }
  it { should be_running }
  it { should have_app_pool('DefaultAppPool') }
  its('app_pool') { should eq 'DefaultAppPool' }
  it { should have_binding('http *:80:') }
  its('bindings') { should include 'http *:80:' }
  it { should have_path('%SystemDrive%\\inetpub\\wwwroot') }
  its('path') { should eq '%SystemDrive%\\inetpub\\wwwroot' }
end

# test compatability with Serverspec
describe iis_website('Default Web Site') do
  it { should exist }
  it { should be_running }
  it { should be_in_app_pool('DefaultAppPool') }
end

describe iis_app('/TestApp', 'Default Web Site') do
  it { sould exist }
  it { should have_application_pool('DefaultAppPool') }
  it { should have_protocols('http') }
  it { should have_site_name('Default Web Site') }
  it { should have_physical_path('C:\\inetpub\\wwwroot\\Test') }
  it { should have_path('\\TestApp') }
end
