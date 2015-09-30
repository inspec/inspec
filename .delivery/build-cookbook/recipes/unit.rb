#
# Cookbook Name:: build-cookbook
# Recipe:: unit
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.
# Author:: Dominik Richter

include_recipe 'build-cookbook::prepare'

home = node['delivery_builder']['repo']

execute 'rake test' do
  command 'bundle exec rake test'
  cwd home
  user node['delivery_builder']['build_user']
end

execute 'dockerized rake' do
  command 'bundle exec rake test:resources config=test/test.yaml'
  cwd home
  user node['delivery_builder']['build_user']
end
