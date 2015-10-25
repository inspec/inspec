#
# Cookbook Name:: build-cookbook
# Recipe:: prepare
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.
# Author:: Dominik Richter

repo_dir = node['delivery_builder']['repo']
cache_dir = File.join(repo_dir, '.cache')

directory cache_dir do
  owner node['delivery_builder']['build_user']
	mode '0755'
end

execute 'bundle install' do
  command "bundle install --path #{cache_dir} --without integration tools"
  cwd repo_dir
  user node['delivery_builder']['build_user']
end

