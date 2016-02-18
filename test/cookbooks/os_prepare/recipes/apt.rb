# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# add nginx apt repository
case node['platform']
when 'ubuntu'
  include_recipe('apt')
  apt_repository 'nginx' do
    uri 'ppa:nginx/stable'
    distribution node['lsb']['codename']
  end
when 'debian'
  include_recipe('apt')
  apt_repository 'nginx' do
    uri 'http://nginx.org/packages/debian'
    distribution node['lsb']['codename']
    components ['nginx']
  end
end
