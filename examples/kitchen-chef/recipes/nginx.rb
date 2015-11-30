# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# install repositories for nginx
case node['platform']
when 'ubuntu'
  include_recipe('apt')
  # if ubuntu, install
  apt_repository 'nginx-php' do
    uri 'ppa:nginx/stable'
    distribution node['lsb']['codename']
  end
when 'centos'
  # add repo for Centos 7
  yum_repository 'nginx' do
    description 'Nginx Repo'
    baseurl 'http://nginx.org/packages/centos/7/x86_64'
    gpgkey 'http://nginx.org/keys/nginx_signing.key'
    action :create
  end
end

# install nginx package
package 'nginx'

# start the service
service 'nginx' do
  action :start
end
