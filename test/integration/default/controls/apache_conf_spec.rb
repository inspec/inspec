if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

supported = %w{ubuntu centos amazon fedora}
unless supported.include?(os[:name])
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on #{supported.join(', ')}.\033[0m"
  return
end

# direct access to params of apache conf
describe apache_conf do
  its('LogLevel') { should cmp 'warn' }
  its('MaxKeepAliveRequests') { should cmp 100 }
  its('ServerSignature') { should cmp 'Off' }
end

# only read one param
describe apache_conf.params('LogLevel') do
  it { should include 'warn' }
end
