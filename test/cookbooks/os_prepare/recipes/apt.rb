# add nginx apt repository
case node['platform']
when 'ubuntu'
  # use ppa
  apt_repository 'nginx' do
    uri 'ppa:nginx/stable'
    distribution node['lsb']['codename']
  end

  apt_repository 'chef-stable' do
    uri 'https://packages.chef.io/stable-apt'
    key 'https://downloads.chef.io/packages-chef-io-public.key'
    distribution node['lsb']['codename']
    components ['main']
    trusted true
  end
when 'debian'
  # use plain repo
  apt_repository 'nginx' do
    uri 'http://nginx.org/packages/debian'
    distribution node['lsb']['codename']
    components ['nginx']
  end

  apt_repository 'chef-stable' do
    uri 'https://packages.chef.io/stable-apt'
    key 'https://downloads.chef.io/packages-chef-io-public.key'
    distribution node['lsb']['codename']
    components ['main']
    trusted true
  end
end
