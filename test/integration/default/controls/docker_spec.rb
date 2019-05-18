if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if !os.linux?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on linux.\033[0m"
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

alpine_id = docker_image(image: 'alpine:latest').id
short_alpine_id = alpine_id.split(':')[1][0..12]
describe docker_image(id: short_alpine_id) do
  it { should exist }
end

describe docker_image(id: alpine_id) do
  it { should exist }
end

describe docker_container('an-echo-server') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'busybox:latest' }
  its('repo') { should eq 'busybox' }
  its('tag') { should eq 'latest' }
  its('ports') { should eq "0.0.0.0:1234->1234/tcp" }
  its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
end

describe docker_container(name: 'an-echo-server') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'busybox:latest' }
  its('repo') { should eq 'busybox' }
  its('tag') { should eq 'latest' }
  its('ports') { should eq "0.0.0.0:1234->1234/tcp" }
  its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
end

describe docker_container(id: docker_container(name: 'an-echo-server').id) do
  it { should exist }
  it { should be_running }
end

describe docker_container('an-echo-server-2') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'busybox:latest' }
  its('repo') { should eq 'busybox' }
  its('tag') { should eq 'latest' }
  its('ports') { should eq "" }
  its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
end

describe docker.version do
  its('Server.Version') { should cmp >= '1.12'}
  its('Client.Version') { should cmp >= '1.12'}
end

# iterate over all running container
docker.containers.ids.each do |id|
  # call docker inspect for a specific container id
  describe docker.object(id) do
    its(%w(HostConfig Privileged)) { should cmp false }
    its(%w(HostConfig Privileged)) { should_not cmp true }
  end
end

describe docker.object(docker.containers.ids[0]) do
  its(%w(HostConfig Privileged)) { should cmp false }
  its(%w(HostConfig Privileged)) { should_not cmp true }
end
