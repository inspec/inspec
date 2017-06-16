# encoding: utf-8
# author: Christoph Hartmann

case node['platform']
when 'ubuntu', 'rhel', 'centos', 'fedora'
  docker_service 'default' do
    action [:create, :start]
  end

  docker_image 'busybox' do
    action :pull
  end

  docker_image 'alpine' do
    action :pull
  end

  docker_container 'an-echo-server' do
    repo 'busybox'
    port '1234:1234'
    command "nc -ll -p 1234 -e /bin/cat"
  end

  docker_container 'an-echo-server-2' do
    repo 'busybox'
    command "nc -ll -p 1234 -e /bin/cat"
  end
end
