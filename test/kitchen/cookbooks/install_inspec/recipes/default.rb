cookbook_file "/root/inspec-core.gem" do
  source "inspec-core.gem"
  action :create
end

cookbook_file "/root/inspec-core-bin.gem" do
  source "inspec-core-bin.gem"
  action :create
end

# Must explicitly remove then re-install as it has an executable file
# conflict with the incoming package
chef_gem "inspec-core" do
  action :remove
end

chef_gem "inspec-core" do
  source "/root/inspec-core.gem"
  action :install
end

chef_gem "inspec-core-bin" do
  source "/root/inspec-core-bin.gem"
  action :upgrade
end
