#
# Cookbook Name:: build-cookbook
# Recipe:: unit
#
# Copyright (c) 2015 Chef Software Inc., All Rights Reserved.
# Author:: Dominik Richter

include_recipe 'build-cookbook::prepare'

home = node['delivery_builder']['repo']

{
  'mock test resources' => 'rake test',
  'docker tests' => 'rake test:docker',
}.each do |title, test|
  execute title do
    command 'bundle exec '+test
    cwd home
    user node['delivery_builder']['build_user']
  end
end
