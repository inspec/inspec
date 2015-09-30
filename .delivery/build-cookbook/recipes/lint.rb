#
# Cookbook Name:: build-cookbook
# Recipe:: lint
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.
# Author:: Dominik Richter

include_recipe 'build-cookbook::prepare'

execute 'rubocop' do
  command 'bundle exec rake lint'
  cwd node['delivery_builder']['repo']
  user node['delivery_builder']['build_user']
end
