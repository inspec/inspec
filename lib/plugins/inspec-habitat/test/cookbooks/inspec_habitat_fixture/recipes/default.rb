#
# Cookbook:: kitchen_setup_cookbook
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package %w{ruby ruby-dev gcc g++ make expect}

base_dir = "/home/vagrant"

cookbook_file "#{base_dir}/inspec-local.gem" do
  source "inspec-local.gem"
  action :create
end

gem_package "inspec" do
  source "#{base_dir}/inspec-local.gem"
  subscribes :install, "cookbook_file[#{base_dir}/inspec-local.gem]", :immediately
end

cookbook_file "#{base_dir}/hab_setup.exp" do
  source "hab_setup.exp"
  mode "0755"
  action :create
end

hab_install "install habitat"
hab_sup "setup hab supervisor"

execute "setup hab cli" do
  command "#{base_dir}/hab_setup.exp"
  live_stream true
  not_if { ::File.exist?("/hab/etc/cli.toml") }
  not_if { ::File.exist?("~/.hab/etc/cli.toml") }
end

execute "create inspec profile for testing" do
  command "inspec init profile #{base_dir}/hab_test_profile"
  live_stream true
  creates "#{base_dir}/hab_test_profile"
end

directory "#{base_dir}/output"

execute "create hart file from profile" do
  command "inspec habitat profile create #{base_dir}/hab_test_profile --output_dir '#{base_dir}/output'"
  live_stream true
  not_if "find #{base_dir}/output | grep vagrant-inspec-profile-hab_test_profile-0.1.0-.*.hart"
end

execute "install vagrant/inspec-profile-hab_test_profile" do
  command "hab pkg install #{base_dir}/output/*.hart"
  live_stream true
  not_if "hab pkg list --origin vagrant | grep inspec-profile"
end

execute "load vagrant/inspec-profile-hab_test_profile into supervisor" do
  command "hab svc load vagrant/inspec-profile-hab_test_profile"
  live_stream true
  not_if 'sudo hab svc status | grep "vagrant/inspec-profile-hab_test_profile"'
end
