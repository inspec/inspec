cookbook_file "/root/inspec-core.gem" do
  source "inspec-core.gem"
  action :create
end

cookbook_file "/root/inspec-core-bin.gem" do
  source "inspec-core-bin.gem"
  action :create
end


chef_gem "inspec-core" do
  source "/root/inspec-core.gem"
  action :upgrade
end

chef_gem "inspec-core-bin" do
  source "/root/inspec-core-bin.gem"
  action :upgrade
end
