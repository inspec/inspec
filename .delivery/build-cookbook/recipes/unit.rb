#
# Cookbook Name:: build-cookbook
# Recipe:: unit
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.
# Author:: Dominik Richter

include_recipe 'build-cookbook::prepare'

execute 'rake test' do
  command 'bundle exec rake'
  cwd node['delivery_builder']['repo']
  user node['delivery_builder']['build_user']
end
