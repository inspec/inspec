# encoding: utf-8
if ENV['DOCKER']
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
  return
end

describe docker_image('busybox:latest') do
  it { should exist }
  its('id') { should_not eq '' }
  its('image') { should eq 'busybox:latest' }
  its('repo') { should eq 'busybox' }
  its('tag') { should eq 'latest' }
end

describe docker_image(image: 'alpine:latest') do
  it { should exist }
  its('id') { should_not eq '' }
  its('image') { should eq 'alpine:latest' }
  its('repo') { should eq 'alpine' }
  its('tag') { should eq 'latest' }
end

describe docker_image(image: 'alpine') do
  it { should exist }
  its('id') { should_not eq '' }
  its('image') { should eq 'alpine:latest' }
  its('repo') { should eq 'alpine' }
  its('tag') { should eq 'latest' }
end

describe docker_image(repo: 'alpine') do
  it { should exist }
  its('id') { should_not eq '' }
  its('image') { should eq 'alpine:latest' }
  its('repo') { should eq 'alpine' }
  its('tag') { should eq 'latest' }
end

describe docker_image(repo: 'alpine', tag: 'latest') do
  it { should exist }
  its('id') { should_not eq '' }
  its('image') { should eq 'alpine:latest' }
  its('repo') { should eq 'alpine' }
  its('tag') { should eq 'latest' }
end

describe docker_container('an-echo-server') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'busybox:latest' }
  its('repo') { should eq 'busybox' }
  its('tag') { should eq 'latest' }
  its('ports') { should eq ["0.0.0.0:1234->1234/tcp"] }
  its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
end

describe docker_container('an-echo-server-2') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'busybox:latest' }
  its('repo') { should eq 'busybox' }
  its('tag') { should eq 'latest' }
  its('ports') { should eq [] }
  its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
end

# versions returns a hash with all possible details
# describe docker.version do
#   it { should eq {}}
# end

# describe docker do
#   its('server_version') { should cmp >= '1.12'}
# end
#
# describe docker do
#   its('client_version') { should cmp >= '1.12'}
# end

# TODO: use filter table for images and container
# iterate over all running container
# docker.ps_ids.each do |id|
#   # call docker inspect for a specific container id
#   describe docker.inspect(id) do
#     its(%w(HostConfig Privileged)) { should cmp false }
#     its(%w(HostConfig Privileged)) { should_not cmp true }
#   end
# end


# require "pry"; binding.pry
# describe docker.inspect(docker.ps_ids[0]) do
#   its(%w(HostConfig Privileged)) { should cmp false }
#   its(%w(HostConfig Privileged)) { should_not cmp true }
# end

# test docker path output
describe docker.path do
  it { should_not eq '' }
end

describe file(docker.path) do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

# test docker socket output
describe docker.socket do
  it { should_not eq '' }
end

describe file(docker.socket) do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
