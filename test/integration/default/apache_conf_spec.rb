# encoding: utf-8
if ENV['DOCKER']
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
  return
end

# direct access to params of apache conf
describe apache_conf do
  its('LogLevel') { should cmp 'warn' }
  its('MaxKeepAliveRequests') { should cmp 100 }
end

# only read one param
describe apache_conf.params('LogLevel') do
  it { should include 'warn' }
end
