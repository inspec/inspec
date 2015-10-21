# encoding: utf-8
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.

include_recipe 'delivery-truck::default'

# create a persistant gem cache per builder for the entire project
gem_cache = File.join(node['delivery']['workspace']['root'], "../../../project_gem_cache")
directory gem_cache do
  # set the owner to the dbuild so that the other recipes can write to here
  owner node['delivery_builder']['build_user']
  mode "0755"
  recursive true
  action :create
end

# ensure we always have a docker group with the build user as a member
group 'docker' do
  members [node['delivery_builder']['build_user']]
end

package 'build-essential'

# get docker
docker_service 'dockerd' do
  action [:create, :start]
  host 'unix:///var/run/docker.sock'
  group 'docker'
  provider Chef::Provider::DockerService::Execute
end

log 'system info' do
  message `uname -a; docker --version; ls -lha /var/run/docker.sock`
  level :warn
end
