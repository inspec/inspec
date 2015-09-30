# encoding: utf-8
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.

# clean up the build node first

group 'docker' do
  members [node['delivery_builder']['build_user']]
end

docker_service 'dockerd' do
  action [:delete, :create, :start]
  host 'unix:///var/run/docker.sock'
  group 'docker'
  provider Chef::Provider::DockerService::Execute
end

log 'system info' do
  message `uname -a; docker --version; ls -lha /var/run/docker.sock`
  level :warn
end
